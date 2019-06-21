clear all;
clc;
mkdir('./date/EEG');		%�����Ե�����Ŀ¼
mkdir('./date/label');			%������ǩ����Ŀ¼
A = zeros(32,511);
for i = 1:1:32					%ѭ��32����ȡ32���˵�����
	d_data = strcat('s',num2str(i),'.mat');	%��ϱ���
	load(d_data);							%��ȡ��i���˵�����
	d_EEG = data;							%��ȡEEG�ź����ݵ�����d_EEG
	d_label = labels;						%��ȡ��ǩ���ݵ�d_label
%	d_label_data = d_label(i,:);			%��ȡ��ǩ���ݵ� d_label_data ������
	d_EEG1 = reshape(d_EEG,[40 40 8064]);	%��ȡEEG�ź�ת����ʽ
	d_EEG_name = strcat('./date/EEG/','s',num2str(i));	%����EEG�ļ���
	mkdir(d_EEG_name);						%����EEG�ļ���
	d_label_name=strcat('./date/label/','SL',num2str(i));	%������ǩ�ļ���
	mkdir(d_label_name);					%������ǩ�ļ���
	d_label_label = strcat(d_label_name,'/','SL',num2str(i),'.txt');
	save(d_label_label,'d_label','-ascii','-double');%����EEG����
	for j = 1:1:40									%ѭ��32����ȡ32��ͨ��������
		d_EEG_data = d_EEG1(j,1:32,384:8064);			%��ȡEEG�ź�
		d_EEG_data1 = reshape(d_EEG_data,[32 7681]);%ת��Ϊ2ά����
		%d_EEG_data_zz = d_EEG_data1';				%ת�ö�ά����	
		d_EEG_label = strcat(d_EEG_name,'/','s',num2str(i),'_',num2str(j),'.txt');
        d_EEG_data1 = cat(2,d_EEG_data1,A);
		save(d_EEG_label,'d_EEG_data1','-ascii','-double');%����EEG����
    end	  
end	