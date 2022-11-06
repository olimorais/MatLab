% Main do trabalho


mat [][];
vet =[1 2 3 0];
for l=1:1:5
    veti=0;
    for m=1:1:5
        for k=1:1:5
            mat [m][l]=0
            m=m+1;
        end
        while veti<5
            if m>=5
                break
            end
        mat[m][l]= vet[veti]
        veti++;
        m=m+1;
        end
    end
end