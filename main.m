
%Load other images:
sysbio      = imread('sysbio.jpg');
sysSize     = size(sysbio);
CVlogo      = imread('CVlogo.jpg');
CVsize      = size(CVlogo);

%Random orders:
rdmTable = dlmread('random.txt','\t');
[M,N]    = size(rdmTable);

%Load numbers:
numbers = loadAllImages('numbers');
numbSize = size(numbers{1});
numbSize = numbSize(1:2);

image([-200 +200],[200 600],CVlogo)
set(gca,'xcolor',get(gcf,'color'));
set(gca,'xtick',[]);
set(gca,'ytick',[]);
set(gcf,'Color','black')
axis equal
pause
clf

for i = 1:N
    %Load images:
    allImages = loadAllImages(['folder_' num2str(i)]);
    imageSize = size(allImages{1});
    imageSize = imageSize(1:2);
    
    order = rdmTable(:,i);
    
    hold all
    image([-500 -250],[450 300],sysbio)
    image([-500 -250],[700 450],CVlogo)
    
    for j = 1:M
        image([-100 numbSize(2)-100],[numbSize(1)*(j+1) numbSize(1)*(j)], ...
            numbers{order(j)});
        image([0 imageSize(2)],[imageSize(1)*(j+1) imageSize(1)*(j)], ...
            allImages{j});
    end
    
    set(gca,'xcolor',get(gcf,'color'));
    set(gca,'xtick',[]);
    set(gca,'ytick',[]);
    set(gcf,'Color','black')
    axis equal
    hold off
    pause
    clf
end