clear all;
clc;
mkdir('./date/EEG');		%????????????????????????????????????
mkdir('./date/label');			%????????????????????????????????????
A1 = zeros(32,7);       %????????????????????
A2 = zeros(32,504);     %????????????
for i = 1:1:32					%????????32??????????????32??????????????????????????
	d_data = strcat('s',num2str(i),'.mat');	%????????????????????
	load(d_data);							%??????????????i??????????????????????????
	d_EEG = data;							%????????EEG??????????????????????????????????d_EEG
	d_label = labels;						%??????????????????????????????d_label
%	d_label_data = d_label(i,:);			%?????????????????????????????? d_label_data ??????????????????
	d_EEG1 = reshape(d_EEG,[40 40 8064]);	%????????EEG????????????????????????
	d_EEG_name = strcat('./date/EEG/','s',num2str(i));	%????????????EEG??????????????
	mkdir(d_EEG_name);						%????????????EEG??????????????
	d_label_name=strcat('./date/label/','SL',num2str(i));	%??????????????????????????????????
	mkdir(d_label_name);					%??????????????????????????????????
	d_label_label = strcat(d_label_name,'/','SL',num2str(i),'.txt');
	save(d_label_label,'d_label','-ascii','-double');%????????????????????????????????
	for j = 1:1:40									%????????32??????????????32????????????????????????????????
		d_EEG_data = d_EEG1(j,1:32,384:8064);			%????????EEG????????
		d_EEG_data1 = reshape(d_EEG_data,[32 7681]);%??????????2??????????????
		%d_EEG_data_zz = d_EEG_data1';				%????????????????????????	
		d_EEG_label = strcat(d_EEG_name,'/','s',num2str(i),'_',num2str(j),'.txt');
        for k = 1:7
            B=d_EEG_data1(:,k);
            A1(:,8-k) = B;
        end
        d_EEG_data1 = cat(2,A1,d_EEG_data1);
        d_EEG_data1 = cat(2,d_EEG_data1,A2);        
		save(d_EEG_label,'d_EEG_data1','-ascii','-double');%????????????EEG????????????
    end	  
end	