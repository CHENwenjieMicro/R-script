rm(list = ls())
install.packages("pheatmap")
library("pheatmap")
setwd("./R-script/pheatmap")
# 读取数据表并标准化百分比
otu <- read.csv("L6.csv", header=T,row.names = 1)
otu=as.data.frame(t(t(otu)/colSums(otu)))
otu20 <- otu[1:20,]#取前二十
group <- read.csv("group.csv", header=T,row.names = 1)#读取分组信息
group1 = data.frame(group)
ar<-colorRampPalette(colors = c("white","red","black"))(111)#添加配色
color1<-list(Group=c(CK = "blue", T1= "grey",T2="#B2CCE7",T3="yellow",T4="pink"))#添加分组配色
pdf("heatmapplpbs.pdf",width=10,height=4)
pheatmap(otu20,treeheight_col=30,treeheight_row=30,annotation_colors =color1,
         cluster_cols =F,cluster_row=T,show_rownames=T,annotation_col=group1,
          annotation_names_col = T,
         fontsize_col = 8, fontsize_row = 8,color=ar,border_color="NA")
dev.off()
