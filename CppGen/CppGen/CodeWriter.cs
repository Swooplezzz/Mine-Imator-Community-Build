﻿using System;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;

namespace CppGen
{
	// Helper class for generating a code file.
	class CodeWriter
	{
		public static int IndentLevel;
		public static bool Indented;
		public static string IndentString;
		public static int Lines;
		public static int TotalLines = 0;
		public static int TotalFilesUpdated = 0;
		public static bool IsNewLine = false;
		static StringBuilder Builder;

		public static void Begin(string indentString = "\t")
		{
			Builder = new StringBuilder("");
			IndentLevel = 0;
			Indented = false;
			IndentString = indentString;
			Lines = 0;

			WriteLine("/*", 1);
			WriteLine("NOTE:");
			WriteLine("This file was autogenerated by CppGen, changes may be overwritten and forever lost!");
			WriteLine("Modify at your own risk!");
			WriteLine();
			WriteLine("[ Generated on " + DateTime.Now.ToString("yyyy.MM.dd HH:mm:ss") + " ]");
			WriteLine("*/", -1);
			WriteLine();
		}

		public static void Write(string code)
		{
			WriteIndent();
			Builder.Append(code);
			IsNewLine = false;
		}

		public static void WriteLine(string code = "", int indentDelta = 0)
		{
			if (indentDelta < 0)
				Indent(-1);
			WriteIndent();

			Builder.AppendLine(code);
			Indented = false;
			Lines++;
			IsNewLine = true;

			if (indentDelta > 0)
				Indent(1);
		}

		public static void Erase(int characters)
		{
			Builder.Remove(Builder.Length - characters, characters);
		}

		public static void Indent(int delta)
		{
			IndentLevel += delta;
		}

		public static void End(string outputFile)
		{
			try
			{
				string code = Builder.ToString();
				if (File.Exists(outputFile)) // Check for difference (except timestamp)
				{
					string codeNoTimestamp = Regex.Replace(code, "\\[ Generated on .*? \\]", "");
					string oldCodeNoTimestamp = Regex.Replace(File.ReadAllText(outputFile), "\\[ Generated on .*? \\]", "");
					if (codeNoTimestamp == oldCodeNoTimestamp)
						return;
				}
				File.WriteAllText(outputFile, code);
				TotalLines += Lines;
				TotalFilesUpdated++;
			}
			catch (Exception ex)
			{
				Console.WriteLine("FATAL ERROR: " + ex.Message);
				Environment.Exit(1);
			}
		}

		static void WriteIndent()
		{
			if (Indented)
				return;

			for (int i = 0; i < IndentLevel; i++)
				Builder.Append(IndentString);
			Indented = true;
		}
	}
}
