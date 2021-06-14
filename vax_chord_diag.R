library(circlize)
library(readr)
library(dplyr)

data <- read_csv2("./chord_diag_eng.csv") %>% 
    na.omit(.)


temak <- colnames(data)[2:ncol(data)]
vakcinak <- data$X1

data <- as.matrix(data[,2:ncol(data)])
colnames(data) <- temak
rownames(data) <- vakcinak



### Magyar
group <- c(Pfizer = "Vaccines", 
Moderna = "Vaccines", AstraZeneca = "Vaccines", Szputnyik = "Vaccines", Sinopharm = "Vaccines", Hatékony = "Efficiency", Hatásos = "Efficiency",
Védettség = "Efficiency" , Mellékhatás = "Concerns",
Önkéntes = "Concerns", Tárgyal = "Technical conditions", Szerződés = "Technical conditions",
Szállít = "Technikai feltételek","Orbán V." = "Politikai dimenzió","Szijjártó P." = "Politikai dimenzió")

### Magyar
grid.col <- c(Pfizer = "#A9A700", Moderna = "#58823D",
             AstraZeneca = "#244776",
             Szputnyik = "#409099",
             Sinopharm = "#77C6D3", 
             Hatékony = "#7A4679", Hatásos = "#7A4679", Védettség = "#7A4679",
             Mellékhatás = "#D81E00", Önkéntes = "#D81E00",
             Tárgyal = "#AB7942", Szerződés = "#AB7942", Szállít = "#AB7942",
             "Orbán V." = "#ED7D31", "Szijjártó P." = "#ED7D31")



#border_mat2 <- matrix("#ff6961", nrow = 1, ncol = ncol(data))
#rownames(border_mat2) <- rownames(data)[1]
#colnames(border_mat2) <- colnames(data)

chordDiagram(data, annotationTrack = c("name","grid"), big.gap = 20, small.gap = 5,
             group = group, row.col = rep("grey",length(grid.col)),
             transparency = 0.5, , grid.col = grid.col)

circos.clear()

# pfizer

chordDiagram(data,annotationTrack = c("name","grid"), big.gap = 20, small.gap = 5,
             row.col = c("#A9A700", rep("grey",length(grid.col)-1)),
             transparency = 0.5, , grid.col = grid.col, group = group)

circos.clear()

# moderna
chordDiagram(data, grid.col = grid.col, annotationTrack = c("name","grid"),
             big.gap = 20, small.gap = 5, group = group,
             row.col = c(rep("grey",3),"#58823D", rep("grey",length(grid.col)-5)), transparency = 0.5)

circos.clear()

# szputnyik
chordDiagram(data, grid.col = grid.col, annotationTrack = c("name","grid"),
             big.gap = 20,small.gap = 5, group = group,
             row.col = c(rep("grey",8), "#409099" ,rep("grey",length(grid.col)-9)), transparency = 0.5)
circos.clear()

# kínai + Sinovac
chordDiagram(data, grid.col = grid.col, annotationTrack = c("name","grid"),
             big.gap = 20,small.gap = 5, group = group,
             row.col = c(rep("grey",9),"#77C6D3", "#637177" ,rep("grey",length(grid.col)-11)), transparency = 0.5)

circos.clear()

#highlight.sector(rownames(data)[1:12], track.index = 1, col = "#5F8787",
    #text = "Vakcinák", cex = 1, text.col = "black", niceFacing = TRUE)

#highlight.sector(colnames(data)[1:3], track.index = 1, col = "#7A4679",
    #text = "Hatékonyság", cex = 1, text.col = "black", niceFacing = TRUE)

#highlight.sector(colnames(data)[4:5], track.index = 1, col = "#D81E00",
    #text = "Aggályok", cex = 1, text.col = "black", niceFacing = TRUE)

#highlight.sector(colnames(data)[6:8], track.index = 1, col = "#AB7942",
    #text = "Technikai Feltételek", cex = 1, text.col = "black", niceFacing = TRUE)

#highlight.sector(colnames(data)[9:10], track.index = 1, col = "#ED7D31",
    #text = "Politikai Dimenzió", cex = 1, text.col = "black", niceFacing = TRUE)
