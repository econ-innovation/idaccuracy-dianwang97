# 使用R中的 数据读写，文件路径，for循环语句，
# 读入路径“/assignment_idaccuracy/Aminer”中的所有文件
# 并将数据合并成为一个data.frame输出
getwd()
setwd(dir = "/Users/wangdian/Downloads/Study/2024_BigData史东波/data/assignment_idaccuracy/Aminer")
# 1. 要求data.frame中至少要包括论文的doi号，发表年份，杂志，标题；
dir = list.files()
# dir <- paste("./",a,sep = "")
n = length(dir)
merge.data <- read.csv(file = dir[1], head=T, sep = ",")
for (i in 2:n) {
  new.data = read.csv(file = dir[i], header = T, sep = ",")
  merge.data = rbind(merge.data,new.data)
}
head(merge.data)

write.csv(merge.data,file = "/Users/wangdian/Downloads/Study/2024_BigData史东波/data/assignment_idaccuracy/merge_all.csv",row.names=FALSE)  

# 2. 使用apply家族函数替代上述步骤中的for循环
# 将这些数据框进行行合并，并将结果存储在result2中
data_list <- lapply(dir, read.csv)
result2 <- do.call(rbind, data_list)
head(result2)
# 3. 将2中代码封装成为一个可以在命令行运行的脚本
# 脚本的唯一一个参数为aminer论文文件所在的路径。
a = getwd()

rcsv_append <- function(a){
  setwd(a)
  dir = list.files()
  data_list <- lapply(dir, read.csv)
  result2 <- do.call(rbind, data_list)
  return(result2)
}

result2 <- rcsv_append(a)
head(result2)

