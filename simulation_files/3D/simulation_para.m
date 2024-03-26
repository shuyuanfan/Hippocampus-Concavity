
% simulation parameters
clc


% parameters for passivity
Q1 = 8;
Q2 = 10;
Q3 = [0.01,5,8];
Q4 = [0.001,0.1,0.1];

% parameters for concave passivity
%slider concave factor
% Q = [kmin,kmax,beta,eta]
% y= (beta*kmin*rho+eta*kmax)/(beta*rho+eta);
Qc1 = [8,50,1,0.01];
Qc2 = [10,80,1,0.02];

qc3_1 = [0.01,1,1,1];
qc3_2 = [5,20,1,0.01];
qc3_3 = [8,30,1,0.02];
Qc3 = [qc3_1;qc3_2;qc3_3];

qc4_1 = [0.001,0.01,1,1];
qc4_2 = [0.1,10,0.01,0.02];
qc4_3 = [0.1,10,0.01,0.02];
Qc4 = [qc4_1;qc4_2;qc4_3];

% parameters for pd controller
% Gains for attitude controller
k_pos_2=8;
k_vel_2=8;
p_roll_2  = 10;
p_pitch_2 = 10;
p_yaw_2   = 10;

d_roll_2  = 1;
d_pitch_2 = 1;
d_yaw_2   = 1;

% parameters for concave Pd control
kp_para=[8,20,1,0.01];
kv_para=[8,20,1,0.01];
proll_para  = [10,10,1,0.01];
ppitch_para = [10,10,1,0.01];
pyaw_para   = [10,20,1,0.01];
droll_para  = [1,1,1,0.01];
dpitch_para = [1,1,1,0.01];
dyaw_para   = [1,1,1,0.01];

%%
%disturbance=1 or 0
disturbance = 1;
out = sim('Concave_hipp.slx');


%%
figure(1)
plot3(out.ref.Data(:,1),out.ref.Data(:,2),out.ref.Data(:,3),'k','LineWidth',1.5);

hold on

plot3(out.passive_state.Data(1,:),out.passive_state.Data(2,:),out.passive_state.Data(3,:),'b-o','MarkerIndices',1:15000:length(out.ref.Data(:,3)),'LineWidth',1.5);

hold on

plot3(out.concave_passive_state.Data(1,:),out.concave_passive_state.Data(2,:),out.concave_passive_state.Data(3,:),'r-*','MarkerIndices',1:10000:length(out.ref.Data(:,3)),'LineWidth',1.5);

hold on

plot3(out.PD_state.Data(1,:),out.PD_state.Data(2,:),out.PD_state.Data(3,:),'g-+','MarkerIndices',1:15000:length(out.ref.Data(:,3)),'LineWidth',1.5);
hold on

xlabel('x(m)','fontsize',20)
ylabel('y(m)','fontsize',20)
zlabel('z(m)','fontsize',20)
grid on
set(gca,'ytick',-8:8:8,'color',[1,1,1],'LineWidth',1,'fontsize',20)
set(gcf,'Position',[300 300 800 600])
legend('Reference','Passive','C-Passive','PD','fontsize',15,'interpreter','latex','NumColumns',3,'Location','north')
legend('boxoff')
view([-60,40])

figure(2)
plot(out.ref.Time,out.tracking_error.Data(:,1),'b','LineWidth',1.5);
ylim([-0,2])
hold on

plot(out.ref.Time,out.tracking_error.Data(:,2),'r','LineWidth',1.5);
ylim([-0,2])
hold on

plot(out.ref.Time,out.tracking_error.Data(:,3),'g','LineWidth',1.5);
ylim([-0,2])
hold on



xlabel('Time(s)','fontsize',20)
ylabel('$||X-X_{ref}||$(m)','interpreter','latex','fontsize',20)
set(gca,'ytick',0:1:2,'color',[1,1,1],'LineWidth',1,'fontsize',20)
%set(gcf,'Position',[300 300 400 300])
legend('Passive','C-Passive','PD','fontsize',15,'interpreter','latex','NumColumns',1,'Location','north')
legend('boxoff')

%%
figure(3)
plot(out.ref.Time,out.tracking_error.Data(:,1),'b','LineWidth',1.5);
ylim([-0,0.7])
hold on

plot(out.ref.Time,out.tracking_error.Data(:,2),'r','LineWidth',1.5);
ylim([-0,0.7])
hold on

plot(out.ref.Time,out.tracking_error.Data(:,3),'g','LineWidth',1.5);
ylim([-0,0.7])
hold on

hold on
set(gca,'ytick',0:0.5:0.7,'color',[1,1,1],'LineWidth',1,'fontsize',20)
%set(gcf,'Position',[300 300 400 300])
xlabel('Time(s)','fontsize',20)
ylabel('$||X-X_{ref}||$(m)','interpreter','latex','fontsize',20)
legend('Passive','C-Passive','PD','fontsize',15,'interpreter','latex','NumColumns',1,'Location','north')
legend('boxoff')


% %% with concave PD controller
% % figures
% figure(1)
% plot3(out.ref.Data(:,1),out.ref.Data(:,2),out.ref.Data(:,3),'k','LineWidth',1.5);
% 
% hold on
% 
% plot3(out.passive_state.Data(1,:),out.passive_state.Data(2,:),out.passive_state.Data(3,:),'b-o','MarkerIndices',1:15000:length(out.ref.Data(:,3)),'LineWidth',1.5);
% 
% hold on
% 
% plot3(out.concave_passive_state.Data(1,:),out.concave_passive_state.Data(2,:),out.concave_passive_state.Data(3,:),'g-*','MarkerIndices',1:10000:length(out.ref.Data(:,3)),'LineWidth',1.5);
% 
% hold on
% 
% plot3(out.PD_state.Data(1,:),out.PD_state.Data(2,:),out.PD_state.Data(3,:),'m-+','MarkerIndices',1:15000:length(out.ref.Data(:,3)),'LineWidth',1.5);
% hold on
% 
% plot3(out.concave_PD_state.Data(1,:),out.concave_PD_state.Data(2,:),out.concave_PD_state.Data(3,:),'r-x','MarkerIndices',1:15000:length(out.ref.Data(:,3)),'LineWidth',1.5);
% hold on
% 
% xlabel('x(m)','fontsize',20)
% ylabel('y(m)','fontsize',20)
% zlabel('z(m)','fontsize',20)
% grid on
% set(gca,'ytick',-8:8:8,'color',[1,1,1],'LineWidth',1,'fontsize',20)
% set(gcf,'Position',[300 300 800 600])
% legend('Reference','Passive','C-Passive','PD','C-PD','fontsize',15,'interpreter','latex','NumColumns',3,'Location','north')
% legend('boxoff')
% view([-60,40])
% 
% figure(2)
% plot(out.ref.Time,out.tracking_error.Data(:,1),'b','LineWidth',1.5);
% ylim([-0,2])
% hold on
% 
% plot(out.ref.Time,out.tracking_error.Data(:,2),'k','LineWidth',1.5);
% ylim([-0,2])
% hold on
% 
% plot(out.ref.Time,out.tracking_error.Data(:,3),'g','LineWidth',1.5);
% ylim([-0,2])
% hold on
% 
% plot(out.ref.Time,out.tracking_error.Data(:,4),'r','LineWidth',1.5);
% ylim([-0,2])
% hold on
% 
% xlabel('Time(s)','fontsize',20)
% ylabel('$||X-X_{ref}||$(m)','interpreter','latex','fontsize',20)
% set(gca,'ytick',0:1:2,'color',[1,1,1],'LineWidth',1,'fontsize',20)
% %set(gcf,'Position',[300 300 400 300])
% legend('Passive','C-Passive','PD','C-PD','fontsize',15,'interpreter','latex','NumColumns',1,'Location','north')
% legend('boxoff')
% 
% %%
% figure(3)
% plot(out.ref.Time,out.tracking_error.Data(:,1),'b','LineWidth',1.5);
% ylim([-0,0.7])
% hold on
% 
% plot(out.ref.Time,out.tracking_error.Data(:,2),'k','LineWidth',1.5);
% ylim([-0,0.7])
% hold on
% 
% plot(out.ref.Time,out.tracking_error.Data(:,3),'g','LineWidth',1.5);
% ylim([-0,0.7])
% hold on
% 
% plot(out.ref.Time,out.tracking_error.Data(:,4),'r','LineWidth',1.5);
% ylim([-0,0.7])
% hold on
% set(gca,'ytick',0:0.5:0.7,'color',[1,1,1],'LineWidth',1,'fontsize',20)
% %set(gcf,'Position',[300 300 400 300])
% xlabel('Time(s)','fontsize',20)
% ylabel('$||X-X_{ref}||$(m)','interpreter','latex','fontsize',20)
% legend('Passive','C-Passive','PD','C-PD','fontsize',15,'interpreter','latex','NumColumns',1,'Location','north')
% legend('boxoff')
