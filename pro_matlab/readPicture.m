%��ȡһ��ͼƬ����ȡ����ʾ���Ժ��ͼ�񴫳�ȥ����ΪҪ��ͼ�����һϵ�д���
function [ str] = readPicture( )
%READPICTURE �˴���ʾ�йش˺�����ժҪ
% ѡ��ͼƬ��������ʾ����
%ѡ��ͼƬ·��
[filename,pathname,filterindex]=uigetfile({'*.jpg';'*.bmp';'*.gif'},'ѡ��ͼƬ')%ѡ��ͼƬ�Ǵ��ڵ�����
%�ϳ�·��+�ļ���
str=[pathname filename];
end

