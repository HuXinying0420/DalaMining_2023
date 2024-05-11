clear
data=load('Iris .txt');
data=data(:,2:end);
K=10;


%% ���������ʼ��
[numOfData,numOfAttr]=size(data);   % numOfData�����ݸ�����numOfAttr������ά��

centroids=zeros(K,numOfAttr);       % �����ʼ�������յ�����ÿһ�������λ��
maxAttr=zeros(numOfAttr);        % ÿһά������
minAttr=zeros(numOfAttr);        % ÿһά��С����
for i=1:numOfAttr
    maxAttr(i)=max(data(:,i));    % ÿһά������
    minAttr(i)=min(data(:,i));    % ÿһά��С����
    for j=1:K
        centroids(j,i)=maxAttr(i)+(minAttr(i)-maxAttr(i))*rand();  % �����ʼ����ѡȡÿһά[min max]�г�ʼ��
    end
end

[Idx,C,distance]=KMeans(data,K,centroids,500);% ����KMeans
Distance=sum(distance)% �������ھ���֮��

%% ����׼ȷ��
c1=Idx(1:50,1);c2=Idx(51:100,1);c3=Idx(101:150,1);
Accuracy=(sum(c1==mode(Idx(1:50,1)))+sum(c2==mode(Idx(51:100,1)))+sum(c3==mode(Idx(101:150,1))))/numOfData