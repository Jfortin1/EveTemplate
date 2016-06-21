# Let's read the labels:
files <- paste0("../data/JHU_MNI_SS_WMPM_Type-", c("I", "II", "III"), "_SlicerLUT.txt")
file.exists(files)

eve_map_labels <- lapply(files, read.table,head=FALSE, 
	colClasses = c("numeric", "character", "numeric", 
		"numeric", "numeric", "character"),
		stringsAsFactors=FALSE)
eve_map_labels <- lapply(eve_map_labels, function(x){
	x <- x[,1:5]
	colnames(x) <- c("integer_label", "text_label", "color_r", "color_g", "color_b")
	rownames(x) <- x[,1]
	x
})
eve_map_labels <- lapply(eve_map_labels, function(x){
	x[,2] <- tolower(x[,2])
	x[,2] <- gsub("-", "_",x[,2])
	x
})


# Adding missing annotation:
for (k in 1:3){
	x <- eve_map_labels[[k]][,2]
	missing <- c("cerebellum", "hippocampus", "amygdala",
		"insular", "gyrus_rectus", "supramarginal_gyrus",
		"middle_fronto_orbital_gyrus", "lateral_fronto_orbital_gyrus",
		"middle_temporal_gyrus", "inferior_temporal_gyrus",
		"superior_temporal_gyrus", "middle_occipital_gyrus",
		"middle_occipital_gyrus", "inferior_occipital_gyrus"
	)
	for (i in 1:length(missing)){
		x[x==missing[i]] <- paste0(missing[i], "_left")
	}
	eve_map_labels[[k]][,2] <- x
}


# Adding right or left:
for (k in 1:3){
	x <- eve_map_labels[[k]][,2]
	right_left <- rep(NA, length(x))
	right_left[grepl("left",x)] <- "left"
	right_left[grepl("right",x)] <- "right"
	structure <- gsub("_left|_right","", x) 
	eve_map_labels[[k]]$structure <- structure
	eve_map_labels[[k]]$right_left <- right_left
}

names(eve_map_labels) <- c("I", "II", "III")
save(eve_map_labels, file="../data/eve_map_labels.rda")













