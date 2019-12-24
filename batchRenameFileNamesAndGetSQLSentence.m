%% 这和脚本的目的是为了重命名文件名，将
% 并获得相应的SQL语句;

clear all;close all;clc;

dataPath = 'D:\Data\renameTest';
dataDir = dir(dataPath);
dataDir = dataDir(3:end,:);
dataDir = struct2cell(dataDir);
filenames = dataDir(1,:);
filenames = sort_nat(filenames);
len = length(filenames);

for i= 1:len
    %do something
    tmpFileName = [dataPath '\' filenames{i}];
%     tmpFileName = tmpFileName(1:end-4);
%     tmpTimeInt = fromFileNameStrGetTimeint(tmpFileName);
%     disp(['old name is ' tmpFileName ', and new name is.... d' num2str(i+8,'%05d')]);
    oldname = tmpFileName;
    newname = ['d' num2str(i+8,'%05d')];%注意这里，只用保留新的文件名就好，不需要保留整个文件路径加文件名
%     movefile(tmpFileName,[dataPath '\tdd' num2str(i+8,'%05d')]);%这种重命名的方法太低效率了；
   
    command = ['rename' 32 oldname 32 newname];
    disp(command);
    status = dos(command);
    if status == 0
        disp([oldname, ' 已被重命名为 ', newname])
    else
        disp([oldname, ' 重命名失败!'])
    end

    SQLSentence = strcat("INSERT into AAA(BBB,CCC,DDD,EEE,FFF,HHH,III,JJJ)values('11','d",num2str(i+8,'%05d'),"','1','2019-12-01 12:15:22','2019-12-01 12:56:11','2019-08-27 12:00:00','",tmpFileName,"','0')");
    disp(SQLSentence);    
%     dataTimes(end+1) = tmpTimeInt;
end
