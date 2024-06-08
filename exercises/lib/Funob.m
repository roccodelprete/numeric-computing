function z=Funob(r)
global xa ya;
residuo=xa.^2+ya.^2-r^2;
z=norm(residuo);
end
