/// vbuffer_create_cylinder(radius, texcoord1, texcoord2, texhorflip, texverflip, detail, smooth, closed, invert, mapped)
/// @arg radius
/// @arg texcoord1
/// @arg texcoord2
/// @arg texhorflip
/// @arg texverflip
/// @arg detail
/// @arg smooth
/// @arg closed
/// @arg invert
/// @arg mapped

function vbuffer_create_cylinder(rad, tex1, tex2, thflip, tvflip, detail, smooth, closed, invert, mapped)
{
	vbuffer_start()
	
	tex1[X] += 0.25
	tex2[X] += 0.25
	
	var i = 0;
	repeat (detail)
	{
		var ip;
		var n1x, n1y, n2x, n2y;
		var x1, y1, x2, y2;
		var texsize, texmid;
		ip = i
		i += 1 / detail
		texsize = point2D_sub(tex2, tex1)
		texmid = point2D_add(tex1, vec2_mul(texsize, 0.5))
		
		n1x = cos(ip * pi * 2)
		n1y = -sin(ip * pi * 2)
		n2x = cos(i * pi * 2)
		n2y = -sin(i * pi * 2)
		x1 = n1x * rad
		y1 = n1y * rad
		x2 = n2x * rad
		y2 = n2y * rad
		
		// Invert normals
		if (invert)
		{
			n1x *= -1
			n1y *= -1
			n2x *= -1
			n2y *= -1
		}
		
		if (mapped)
		{
			texsize = vec2((1 / 3) * thflip, tvflip)
			texmid[Y] = texsize[Y] / 2
		}
		
		if (closed)
		{
			 // Bottom
			texmid[X] = mapped ? 5 / 6 : 0.5
			
			vbuffer_add_triangle(0, 0, -rad, x1, y1, -rad, x2, y2, -rad, 
									texmid[X], texmid[Y], 
									texmid[X] + cos(ip * pi * 2) * (texsize[X] / 2), texmid[Y] + sin(ip * pi * 2) * (texsize[Y] / 2), 
									texmid[X] + cos(i * pi * 2) * (texsize[X] / 2), texmid[Y] + sin(i * pi * 2) * (texsize[Y] / 2), invert)
			
			// Top
			texmid[X] = 0.5
			
			vbuffer_add_triangle(0, 0, rad, x2, y2, rad, x1, y1, rad, 
									texmid[X], texmid[Y], 
									texmid[X] + cos(i * pi * 2) * (texsize[X] / 2), texmid[Y] - sin(i * pi * 2) * (texsize[Y] / 2), 
									texmid[X] + cos(ip * pi * 2) * (texsize[X] / 2), texmid[Y] - sin(ip * pi * 2) * (texsize[Y] / 2), invert)
		}
		
		// Sides
		if (mapped)
		{
			tex1 = point2D(0, 0)
			tex2 = point2D(abs(texsize[X]), abs(texsize[Y]))
			if (thflip < 0)
			{
				var tmp = tex1[X];
				tex1[X] = tex2[X]
				tex2[X] = tmp
			}
			if (tvflip < 0)
			{
				var tmp = tex1[Y];
				tex1[Y] = tex2[Y]
				tex2[Y] = tmp
			}
		}
		
		if (!smooth)
		{
			var normx, normy;
			normx = (n1x + n2x) / 2
			normy = (n1y + n2y) / 2
			
			n1x = normx
			n2x = normx
			n1y = normy
			n2y = normy
		}
		
		if (invert)
		{
			vertex_add(x1, y1, rad, n1x, n1y, 0, tex1[X] + texsize[X] * ip, tex1[Y])
			vertex_add(x1, y1, -rad, n1x, n1y, 0, tex1[X] + texsize[X] * ip, tex1[Y] + texsize[Y])
			vertex_add(x2, y2, rad, n2x, n2y, 0, tex1[X] + texsize[X] * i, tex1[Y])
			
			vertex_add(x2, y2, -rad, n2x, n2y, 0, tex1[X] + texsize[X] * i, tex1[Y] + texsize[Y])
			vertex_add(x2, y2, rad, n2x, n2y, 0, tex1[X] + texsize[X] * i, tex1[Y])
			vertex_add(x1, y1, -rad, n1x, n1y, 0, tex1[X] + texsize[X] * ip, tex1[Y] + texsize[Y])
		}
		else
		{
			vertex_add(x1, y1, -rad, n1x, n1y, 0, tex1[X] + texsize[X] * ip, tex1[Y] + texsize[Y])
			vertex_add(x1, y1, rad, n1x, n1y, 0, tex1[X] + texsize[X] * ip, tex1[Y])
			vertex_add(x2, y2, rad, n2x, n2y, 0, tex1[X] + texsize[X] * i, tex1[Y])
			
			vertex_add(x2, y2, rad, n2x, n2y, 0, tex1[X] + texsize[X] * i, tex1[Y])
			vertex_add(x2, y2, -rad, n2x, n2y, 0, tex1[X] + texsize[X] * i, tex1[Y] + texsize[Y])
			vertex_add(x1, y1, -rad, n1x, n1y, 0, tex1[X] + texsize[X] * ip, tex1[Y] + texsize[Y])
		}
	}
	
	return vbuffer_done()
}
