# SE-PhDThesis

This is a LaTeX class as well as a template for writing a PhD-thesis according to a style similar to the one commonly used at Lund university and many other Swedish universities. The class as well as the template is based on work done by Erik Hedström but little of his original code remain here.

The class requires the use of LuaLaTeX though it is quite easy to remove this requirement by removing the line:

	\usepackage{fontspec}
	
From ``sephdthesis.cls`` and replacing it with (if using utf-8):

	\usepackge[utf8]{inputenc}

As the files provided here are based on how I wanted my own thesis to look, some modifications might be required by you in order for the output to fit our purposes. Because of this, some experience with LaTeX is recommended when using this template.

The template and class is provided as is with no license or copyright. Use it as you see fit.