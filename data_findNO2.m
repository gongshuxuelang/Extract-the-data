clear all;
clc;
mkdir('./date/EEG');		%创建脑电数据目录
mkdir('./date/label');			%创建标签数据目录
A = zeros(32,511);
for i = 1:1:32					%循环32次提取32个人的数据
	d_data = strcat('s',num2str(i),'.mat');	%组合变量
	load(d_data);							%提取第i个人的数据
	d_EEG = data;							%读取EEG信号数据到变量d_EEG
	d_label = labels;						%读取标签数据到d_label
%	d_label_data = d_label(i,:);			%提取标签数据到 d_label_data 变量中
	d_EEG1 = reshape(d_EEG,[40 40 8064]);	%提取EEG信号转换格式
	d_EEG_name = strcat('./date/EEG/','s',num2str(i));	%创建EEG文件夹
	mkdir(d_EEG_name);						%创建EEG文件夹
	d_label_name=strcat('./date/label/','SL',num2str(i));	%创建标签文件夹
	mkdir(d_label_name);					%创建标签文件夹
	d_label_label = strcat(d_label_name,'/','SL',num2str(i),'.txt');
	save(d_label_label,'d_label','-ascii','-double');%保存EEG数据
	for j = 1:1:40									%循环32次提取32个通道的数据
		d_EEG_data = d_EEG1(j,1:32,384:8064);			%读取EEG信号
		d_EEG_data1 = reshape(d_EEG_data,[32 7681]);%转换为2维数据
		%d_EEG_data_zz = d_EEG_data1';				%转置二维数据	
		d_EEG_label = strcat(d_EEG_name,'/','s',num2str(i),'_',num2str(j),'.txt');
        d_EEG_data1 = cat(2,d_EEG_data1,A);
		save(d_EEG_label,'d_EEG_data1','-ascii','-double');%保存EEG数据
    end	  
end	