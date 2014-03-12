BEGIN { 
  dimension = 0;		# flag for processing Dimension
  vertices = 0;			# number of vertices to process
}
dimension == 0 && vertices <= 0 { print } # normal (pass unmodified)

dimension == -1 { 		# Output Dimension as 2.
  print 2;
  dimension = 0;		# our work is done
}
/Dimension/ { dimension = -1; }	# Get ready to process Dimension.

vertices > 0 {			# Omit z for each vertex.
  print $1, $2, $4;
  vertices--;
}
vertices == -1 { vertices = $1; } # Read the number of vertices.
/Vertices/ { vertices = -1; }	# Get ready to process vertices.
