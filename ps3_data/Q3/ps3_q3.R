setwd("/Users/michaelyao/desktop/Bioinfo M226/ps3_data/Q3")
library(stats)
library('tidyverse')
library(ggfortify)
data = read_tsv('q3.data.txt')
snps = data %>% select(starts_with('rs'))

the_pca <- prcomp(snps,scale=TRUE)
the_pca$x[,1]

data$PC1 = the_pca$x[,1]
data$PC2 = the_pca$x[,2]
pca_df=data

ggplot(data = pca_df) + 
  geom_point(aes(x = PC1, y = PC2, color = population)) + 
  scale_color_brewer(palette ='Set1') +
  theme_bw() 

#kmean

the_kmean=kmeans(snps,4)
data$kmean = the_kmean$cluster
kmean_df=data
kmean_df$kmean=as.factor(kmean_df$kmean)

ggplot(data = kmean_df) + 
  geom_point(aes(x = PC1, y = PC2, color = kmean)) + 
  scale_color_brewer(palette ='Set1') +
  theme_bw()

diff=0
for (i in 1:1092) {
  punish=1
  if(kmean_df[i,2]=='EUR' & kmean_df[i,13242] ==2){
    punish=0
  }
  if(kmean_df[i,2]=='ASN' & kmean_df[i,13242] ==1){
    punish=0
  }
  if(kmean_df[i,2]=='AMR' & kmean_df[i,13242] ==3){
    punish=0
  }
  if(kmean_df[i,2]=='AFR' & kmean_df[i,13242] ==4){
    punish=0
  }
  diff=diff+punish
}
diff
#fraction=0.9413919
       