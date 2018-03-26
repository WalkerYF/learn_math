p=[0.8 0.1 0.1;0.5 0.1 0.4;0.5 0.3 0.2];
p=sym(p')
% p=p'
[x,y]=eig(p)
for i=1:3
x(:,i)=x(:,i)/sum(x(:,i));
end
x