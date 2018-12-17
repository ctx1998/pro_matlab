%读取一张图片，读取完显示完以后把图像传出去，因为要对图像进行一系列处理
function [ str] = readPicture( )
%READPICTURE 此处显示有关此函数的摘要
% 选择图片并将其显示出来
%选择图片路径
[filename,pathname,filterindex]=uigetfile({'*.jpg';'*.bmp';'*.gif'},'选择图片')%选择图片是窗口的名字
%合成路径+文件名
str=[pathname filename];
end

