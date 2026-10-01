classdef ea3hw1 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        TabGroup                        matlab.ui.container.TabGroup
        SlidingBoxTab                   matlab.ui.container.Tab
        GraphsPanel                     matlab.ui.container.Panel
        energy_graph                    matlab.ui.control.UIAxes
        speed_graph                     matlab.ui.control.UIAxes
        position_graph                  matlab.ui.control.UIAxes
        InputsPanel                     matlab.ui.container.Panel
        stop_value                      matlab.ui.control.NumericEditField
        Label                           matlab.ui.control.Label
        stop_type                       matlab.ui.control.DropDown
        StopsimulationwhenDropDownLabel  matlab.ui.control.Label
        theta                           matlab.ui.control.NumericEditField
        RampangledegreesEditFieldLabel  matlab.ui.control.Label
        m                               matlab.ui.control.NumericEditField
        MasskgEditFieldLabel            matlab.ui.control.Label
        u                               matlab.ui.control.NumericEditField
        CoefficientoffrictionEditFieldLabel  matlab.ui.control.Label
        xaxis                           matlab.ui.control.DropDown
        xaxisDropDownLabel              matlab.ui.control.Label
        RunButton                       matlab.ui.control.Button
        VisualizationPanel              matlab.ui.container.Panel
        visualization                   matlab.ui.control.UIAxes
        InitialandFinalConditionsPanel  matlab.ui.container.Panel
        FinalEEditField                 matlab.ui.control.EditField
        FinalEEditFieldLabel            matlab.ui.control.Label
        InitialEEditField               matlab.ui.control.EditField
        InitialEEditFieldLabel_2        matlab.ui.control.Label
        FinalthermalEditField           matlab.ui.control.EditField
        FinalthermalEditFieldLabel      matlab.ui.control.Label
        FinalPEEditField                matlab.ui.control.EditField
        FinalPEEditFieldLabel           matlab.ui.control.Label
        FinalKEEditField                matlab.ui.control.EditField
        InitialXEditField_2Label_3      matlab.ui.control.Label
        FinalvEditField                 matlab.ui.control.EditField
        FinalvEditFieldLabel            matlab.ui.control.Label
        FinalxEditField                 matlab.ui.control.EditField
        FinalxEditFieldLabel            matlab.ui.control.Label
        FinaltEditField                 matlab.ui.control.EditField
        FinaltEditFieldLabel            matlab.ui.control.Label
        InitialthermalEditField         matlab.ui.control.EditField
        InitialthermalEditFieldLabel    matlab.ui.control.Label
        InitialPEEditField              matlab.ui.control.EditField
        InitialPEEditFieldLabel         matlab.ui.control.Label
        InitialKEEditField              matlab.ui.control.EditField
        InitialXEditField_2Label_2      matlab.ui.control.Label
        InitialvEditField               matlab.ui.control.EditField
        InitialvEditFieldLabel          matlab.ui.control.Label
        InitialxEditField               matlab.ui.control.EditField
        InitialxEditFieldLabel          matlab.ui.control.Label
        InitialtEditField               matlab.ui.control.EditField
        InitialtEditFieldLabel          matlab.ui.control.Label
        CollisionTab_2                  matlab.ui.container.Tab
        GraphsPanel_2                   matlab.ui.container.Panel
        energy_graph_2                  matlab.ui.control.UIAxes
        speed_graph_2                   matlab.ui.control.UIAxes
        position_graph_2                matlab.ui.control.UIAxes
        InputsPanel_2                   matlab.ui.container.Panel
        stop_value_2                    matlab.ui.control.NumericEditField
        Label_2                         matlab.ui.control.Label
        stop_type_2                     matlab.ui.control.DropDown
        StopsimulationwhenDropDownLabel_2  matlab.ui.control.Label
        theta_2                         matlab.ui.control.NumericEditField
        RampangledegreesEditFieldLabel_2  matlab.ui.control.Label
        m_2                             matlab.ui.control.NumericEditField
        MasskgEditFieldLabel_2          matlab.ui.control.Label
        u_2                             matlab.ui.control.NumericEditField
        CoefficientoffrictionEditFieldLabel_2  matlab.ui.control.Label
        xaxis_2                         matlab.ui.control.DropDown
        xaxisDropDownLabel_2            matlab.ui.control.Label
        RunButton_2                     matlab.ui.control.Button
        VisualizationPanel_2            matlab.ui.container.Panel
        visualization_2                 matlab.ui.control.UIAxes
        InitialandFinalConditionsPanel_2  matlab.ui.container.Panel
        FinalEEditField_2               matlab.ui.control.EditField
        FinalEEditField_2Label          matlab.ui.control.Label
        InitialEEditField_2             matlab.ui.control.EditField
        InitialEEditField_2Label        matlab.ui.control.Label
        FinalthermalEditField_2         matlab.ui.control.EditField
        FinalthermalEditField_2Label    matlab.ui.control.Label
        FinalPEEditField_2              matlab.ui.control.EditField
        FinalPEEditField_2Label         matlab.ui.control.Label
        FinalKEEditField_2              matlab.ui.control.EditField
        FinalKEEditField_2Label         matlab.ui.control.Label
        FinalvEditField_2               matlab.ui.control.EditField
        FinalvEditField_2Label          matlab.ui.control.Label
        FinalxEditField_2               matlab.ui.control.EditField
        FinalxEditField_2Label          matlab.ui.control.Label
        FinaltEditField_2               matlab.ui.control.EditField
        FinaltEditField_2Label          matlab.ui.control.Label
        InitialthermalEditField_2       matlab.ui.control.EditField
        InitialthermalEditField_2Label  matlab.ui.control.Label
        InitialPEEditField_2            matlab.ui.control.EditField
        InitialPEEditField_2Label       matlab.ui.control.Label
        InitialKEEditField_2            matlab.ui.control.EditField
        InitialKEEditField_2Label       matlab.ui.control.Label
        InitialvEditField_2             matlab.ui.control.EditField
        InitialvEditField_2Label        matlab.ui.control.Label
        InitialxEditField_2             matlab.ui.control.EditField
        InitialxEditField_2Label        matlab.ui.control.Label
        InitialtEditField_2             matlab.ui.control.EditField
        InitialtEditField_2Label        matlab.ui.control.Label
    end

    
    methods (Access = private)
        
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            % Friendly defaults for the teaching module.
            app.UIFigure.Name = 'EA3 Mechanics Study Lab';

            % Sliding-box defaults and editable initial conditions.
            app.u.Value = 0.20;
            app.m.Value = 5;
            app.theta.Value = 25;
            app.xaxis.Value = 'along the ramp';
            app.stop_type.Value = 'position';
            app.stop_value.Value = -3;
            app.InitialtEditField.Value = '0';
            app.InitialxEditField.Value = '0';
            app.InitialvEditField.Value = '0';

            % Sliding-box calculated fields are outputs.
            rampOutputs = {app.InitialKEEditField, app.InitialPEEditField, ...
                app.InitialthermalEditField, app.InitialEEditField, ...
                app.FinaltEditField, app.FinalxEditField, app.FinalvEditField, ...
                app.FinalKEEditField, app.FinalPEEditField, ...
                app.FinalthermalEditField, app.FinalEEditField};
            for k = 1:numel(rampOutputs)
                rampOutputs{k}.Editable = 'off';
                rampOutputs{k}.Value = '--';
            end

            % Collision defaults. The left side of the lower panel contains
            % user inputs; the right side contains numerical results.
            app.xaxis_2.Value = 'Perfectly elastic';
            app.u_2.Value = 0.05;
            app.m_2.Value = 2;
            app.theta_2.Value = 1;
            app.stop_type_2.Value = 'time';
            app.stop_value_2.Value = 5;

            app.InitialtEditField_2.Value = '9.81';   % g
            app.InitialxEditField_2.Value = '-2';     % x1(0)
            app.InitialvEditField_2.Value = '3';      % v1(0)
            app.InitialKEEditField_2.Value = '2';     % x2(0)
            app.InitialPEEditField_2.Value = '-1';    % v2(0)
            app.InitialthermalEditField_2.Value = '0.5'; % restitution for imperfect case

            collisionOutputs = {app.InitialEEditField_2, app.FinaltEditField_2, ...
                app.FinalxEditField_2, app.FinalvEditField_2, ...
                app.FinalKEEditField_2, app.FinalPEEditField_2, ...
                app.FinalthermalEditField_2, app.FinalEEditField_2};
            for k = 1:numel(collisionOutputs)
                collisionOutputs{k}.Editable = 'off';
                collisionOutputs{k}.Value = '--';
            end
        end

        % Button down function: UIFigure
        function RunSlide(app, event) %#ok<INUSD>
            % Intentionally empty. Simulations are started with the Run buttons.
        end

        % Button pushed function: RunButton (sliding box)
        function RunButtonPushed(app, event) %#ok<INUSD>
            g = 9.81;
            m = app.m.Value;
            mu = app.u.Value;
            theta = app.theta.Value;
            stopValue = app.stop_value.Value;
            stopType = app.stop_type.Value;
            coordType = strtrim(app.xaxis.Value);

            t0 = str2double(app.InitialtEditField.Value);
            x0User = str2double(app.InitialxEditField.Value);
            v0User = str2double(app.InitialvEditField.Value);

            vals = [m mu theta stopValue t0 x0User v0User];
            if any(isnan(vals) | isinf(vals))
                uialert(app.UIFigure, 'Enter finite numeric values for all sliding-box inputs.', 'Input Error');
                return
            end
            if m <= 0
                uialert(app.UIFigure, 'Mass must be greater than zero.', 'Input Error');
                return
            end
            if mu < 0
                uialert(app.UIFigure, 'Coefficient of friction cannot be negative.', 'Input Error');
                return
            end
            if theta < 0 || theta >= 89.5
                uialert(app.UIFigure, 'Use a ramp angle from 0 to 89.5 degrees.', 'Input Error');
                return
            end

            % Internal coordinate s is positive UP the ramp.
            if strcmp(coordType, 'along the ground')
                cth = cosd(theta);
                if abs(cth) < 1e-4
                    uialert(app.UIFigure, 'Horizontal x is not useful for a nearly vertical ramp.', 'Input Error');
                    return
                end
                s0 = x0User / cth;
                v0 = v0User / cth;
            else
                s0 = x0User;
                v0 = v0User;
            end

            if strcmp(stopType, 'time')
                if stopValue <= t0
                    uialert(app.UIFigure, 'For a time stop, the target time must be greater than the initial time.', 'Input Error');
                    return
                end
                maxElapsed = stopValue - t0;
            else
                maxElapsed = 30;
            end

            dt = 0.01;
            nMax = max(2, ceil(maxElapsed/dt) + 1);
            t = zeros(1,nMax);
            s = zeros(1,nMax);
            v = zeros(1,nMax);
            thermal = zeros(1,nMax);
            t(1) = t0;
            s(1) = s0;
            v(1) = v0;

            % Initial values in the selected coordinate system.
            if strcmp(coordType, 'along the ground')
                xInitial = s0*cosd(theta);
                vInitial = v0*cosd(theta);
            else
                xInitial = s0;
                vInitial = v0;
            end

            reached = false;
            last = 1;
            if strcmp(stopType, 'position') && abs(xInitial-stopValue) < 1e-10
                reached = true;
            elseif strcmp(stopType, 'velocity') && abs(vInitial-stopValue) < 1e-10
                reached = true;
            end

            gravAccel = -g*sind(theta);
            frictionAccel = mu*g*cosd(theta);
            frictionForce = mu*m*g*cosd(theta);

            for k = 2:nMax
                if reached
                    break
                end

                dtStep = min(dt, t0 + maxElapsed - t(k-1));
                if dtStep <= 0
                    break
                end
                t(k) = t(k-1) + dtStep;

                vPrev = v(k-1);

                % Coulomb friction. The same coefficient is used for the
                % static threshold and kinetic friction as a teaching-model caveat.
                if abs(vPrev) < 1e-9
                    if abs(gravAccel) <= frictionAccel
                        a = 0;
                    else
                        a = gravAccel - frictionAccel*sign(gravAccel);
                    end
                else
                    a = gravAccel - frictionAccel*sign(vPrev);
                end

                vNew = vPrev + a*dtStep;

                % Do not allow a finite time step to jump through a turning point.
                if abs(vPrev) > 1e-9 && sign(vNew) ~= sign(vPrev)
                    vNew = 0;
                end

                sNew = s(k-1) + 0.5*(vPrev + vNew)*dtStep;
                ds = sNew - s(k-1);

                s(k) = sNew;
                v(k) = vNew;
                thermal(k) = thermal(k-1) + frictionForce*abs(ds);
                last = k;

                if strcmp(coordType, 'along the ground')
                    xPrev = s(k-1)*cosd(theta);
                    xNow = s(k)*cosd(theta);
                    velPrev = v(k-1)*cosd(theta);
                    velNow = v(k)*cosd(theta);
                else
                    xPrev = s(k-1);
                    xNow = s(k);
                    velPrev = v(k-1);
                    velNow = v(k);
                end

                switch stopType
                    case 'time'
                        reached = t(k) >= stopValue - 1e-12;
                    case 'position'
                        reached = (xPrev-stopValue)*(xNow-stopValue) <= 0;
                    case 'velocity'
                        reached = (velPrev-stopValue)*(velNow-stopValue) <= 0;
                end
            end

            t = t(1:last);
            s = s(1:last);
            v = v(1:last);
            thermal = thermal(1:last);

            if strcmp(coordType, 'along the ground')
                xPlot = s*cosd(theta);
                vPlot = v*cosd(theta);
                xLabelText = 'Horizontal position (m)';
            else
                xPlot = s;
                vPlot = v;
                xLabelText = 'Position up ramp (m)';
            end

            % Energy accounting. Potential-energy zero is at s = 0.
            KE = 0.5*m*v.^2;
            PE = m*g*s*sind(theta);
            totalAccounted = KE + PE + thermal;
            energyError = totalAccounted - totalAccounted(1);
            maxEnergyError = max(abs(energyError));

            % Graphs.
            cla(app.position_graph)
            plot(app.position_graph,t,xPlot,'LineWidth',2)
            title(app.position_graph,'Position vs Time')
            xlabel(app.position_graph,'Time (s)')
            ylabel(app.position_graph,xLabelText)
            grid(app.position_graph,'on')

            cla(app.speed_graph)
            plot(app.speed_graph,t,abs(vPlot),'LineWidth',2)
            title(app.speed_graph,'Speed vs Time')
            xlabel(app.speed_graph,'Time (s)')
            ylabel(app.speed_graph,'Speed (m/s)')
            grid(app.speed_graph,'on')

            cla(app.energy_graph)
            plot(app.energy_graph,t,KE,'LineWidth',1.8)
            hold(app.energy_graph,'on')
            plot(app.energy_graph,t,PE,'LineWidth',1.8)
            plot(app.energy_graph,t,thermal,'LineWidth',1.8)
            plot(app.energy_graph,t,totalAccounted,'LineWidth',2.2)
            hold(app.energy_graph,'off')
            title(app.energy_graph,sprintf('Energy | max balance error %.2e J',maxEnergyError))
            xlabel(app.energy_graph,'Time (s)')
            ylabel(app.energy_graph,'Energy (J)')
            legend(app.energy_graph,{'Kinetic','Potential','Thermal','Accounted total'},'Location','best')
            grid(app.energy_graph,'on')

            % Ramp animation.
            ax = app.visualization;
            cla(ax)
            hold(ax,'on')
            th = deg2rad(theta);
            sMin = min(s) - 0.8;
            sMax = max(s) + 0.8;
            if sMax-sMin < 2
                midS = 0.5*(sMin+sMax);
                sMin = midS-1;
                sMax = midS+1;
            end
            rampX = [sMin sMax]*cos(th);
            rampY = [sMin sMax]*sin(th);
            plot(ax,rampX,rampY,'LineWidth',4)
            axis(ax,'equal')
            xPad = max(1,0.08*max(1,max(rampX)-min(rampX)));
            yPad = max(1,0.15*max(1,max(rampY)-min(rampY)));
            xlim(ax,[min(rampX)-xPad max(rampX)+xPad])
            ylim(ax,[min(rampY)-0.5 max(rampY)+yPad])
            ax.XTick = [];
            ax.YTick = [];
            title(ax,'Sliding Box (positive direction is up the ramp)')

            boxW = 0.55;
            boxH = 0.45;
            localCorners = [-boxW/2 0; boxW/2 0; boxW/2 boxH; -boxW/2 boxH];
            R = [cos(th) -sin(th); sin(th) cos(th)];
            baseCorners = (R*localCorners')';
            massScale = max(0,min(1,(m-1)/19));
            lightPink = [1.00 0.72 0.91];
            darkPink = [0.55 0.16 0.43];
            boxColor = lightPink + massScale*(darkPink-lightPink);
            firstCenter = [s(1)*cos(th), s(1)*sin(th)];
            c = baseCorners + firstCenter;
            boxPatch = patch(ax,c(:,1),c(:,2),boxColor,'EdgeColor',[0.25 0.25 0.25]);

            frameIdx = unique(round(linspace(1,numel(t),min(120,numel(t)))));
            for j = 1:numel(frameIdx)
                i = frameIdx(j);
                center = [s(i)*cos(th), s(i)*sin(th)];
                c = baseCorners + center;
                boxPatch.XData = c(:,1);
                boxPatch.YData = c(:,2);
                drawnow
            end
            hold(ax,'off')

            % Numerical initial/final conditions.
            app.InitialtEditField.Value = sprintf('%.3g',t0);
            app.InitialxEditField.Value = sprintf('%.3g',xInitial);
            app.InitialvEditField.Value = sprintf('%.3g',vInitial);
            app.InitialKEEditField.Value = sprintf('%.3f J',KE(1));
            app.InitialPEEditField.Value = sprintf('%.3f J',PE(1));
            app.InitialthermalEditField.Value = sprintf('%.3f J',thermal(1));
            app.InitialEEditField.Value = sprintf('%.3f J',totalAccounted(1));

            app.FinaltEditField.Value = sprintf('%.3f s',t(end));
            app.FinalxEditField.Value = sprintf('%.3f m',xPlot(end));
            app.FinalvEditField.Value = sprintf('%.3f m/s',vPlot(end));
            app.FinalKEEditField.Value = sprintf('%.3f J',KE(end));
            app.FinalPEEditField.Value = sprintf('%.3f J',PE(end));
            app.FinalthermalEditField.Value = sprintf('%.3f J',thermal(end));
            app.FinalEEditField.Value = sprintf('%.3f J',totalAccounted(end));

            if ~reached && ~strcmp(stopType,'time')
                uialert(app.UIFigure, ...
                    'The requested final condition was not reached within 30 s. The displayed graphs show the simulated interval.', ...
                    'Condition Not Reached');
            end
        end

        % Button pushed function: RunButton_2 (1-D collisions)
        function RunCollisionButtonPushed(app, event) %#ok<INUSD>
            collisionType = app.xaxis_2.Value;
            mu = app.u_2.Value;
            m1 = app.m_2.Value;
            m2 = app.theta_2.Value;
            stopType = app.stop_type_2.Value;
            stopValue = app.stop_value_2.Value;

            g = str2double(app.InitialtEditField_2.Value);
            x10 = str2double(app.InitialxEditField_2.Value);
            v10 = str2double(app.InitialvEditField_2.Value);
            x20 = str2double(app.InitialKEEditField_2.Value);
            v20 = str2double(app.InitialPEEditField_2.Value);
            eUser = str2double(app.InitialthermalEditField_2.Value);

            vals = [mu m1 m2 stopValue g x10 v10 x20 v20 eUser];
            if any(isnan(vals) | isinf(vals))
                uialert(app.UIFigure, 'Enter finite numeric values for all collision inputs.', 'Input Error');
                return
            end
            if m1 <= 0 || m2 <= 0
                uialert(app.UIFigure, 'Both masses must be greater than zero.', 'Input Error');
                return
            end
            if mu < 0 || g <= 0
                uialert(app.UIFigure, 'Friction must be nonnegative and g must be positive.', 'Input Error');
                return
            end
            if x10 >= x20
                uialert(app.UIFigure, 'For this teaching model, start Object 1 to the left of Object 2 (x1 < x2).', 'Input Error');
                return
            end

            switch collisionType
                case 'Perfectly elastic'
                    e = 1;
                case 'Perfectly inelastic'
                    e = 0;
                otherwise
                    e = eUser;
                    if e < 0 || e > 1
                        uialert(app.UIFigure, 'For an imperfectly inelastic collision, restitution e must be between 0 and 1.', 'Input Error');
                        return
                    end
            end

            if strcmp(stopType,'time')
                if stopValue <= 0
                    uialert(app.UIFigure, 'The stop time must be greater than zero.', 'Input Error');
                    return
                end
                maxTime = stopValue;
            else
                maxTime = 20;
            end

            dt = 0.005;
            nMax = max(2,ceil(maxTime/dt)+1);
            t = zeros(1,nMax);
            x1 = zeros(1,nMax);
            x2 = zeros(1,nMax);
            v1 = zeros(1,nMax);
            v2 = zeros(1,nMax);
            thermal = zeros(1,nMax);
            internalLoss = zeros(1,nMax);

            x1(1) = x10;
            x2(1) = x20;
            v1(1) = v10;
            v2(1) = v20;

            collided = false;
            collisionTime = NaN;
            pBeforeCollision = NaN;
            pAfterCollision = NaN;
            reached = false;
            last = 1;

            for k = 2:nMax
                if reached
                    break
                end
                dtStep = min(dt,maxTime-t(k-1));
                if dtStep <= 0
                    break
                end
                t(k) = t(k-1) + dtStep;

                % Apply horizontal Coulomb friction. If the perfectly
                % inelastic pair has already stuck together, keep one common velocity.
                if collided && e == 0
                    vCommon = v1(k-1);
                    if abs(vCommon) > 1e-9
                        vNew = vCommon - mu*g*sign(vCommon)*dtStep;
                        if sign(vNew) ~= sign(vCommon)
                            vNew = 0;
                        end
                    else
                        vNew = 0;
                    end
                    dx = 0.5*(vCommon+vNew)*dtStep;
                    x1New = x1(k-1) + dx;
                    x2New = x2(k-1) + dx;
                    v1New = vNew;
                    v2New = vNew;
                else
                    v1Prev = v1(k-1);
                    if abs(v1Prev) > 1e-9
                        v1New = v1Prev - mu*g*sign(v1Prev)*dtStep;
                        if sign(v1New) ~= sign(v1Prev)
                            v1New = 0;
                        end
                    else
                        v1New = 0;
                    end

                    v2Prev = v2(k-1);
                    if abs(v2Prev) > 1e-9
                        v2New = v2Prev - mu*g*sign(v2Prev)*dtStep;
                        if sign(v2New) ~= sign(v2Prev)
                            v2New = 0;
                        end
                    else
                        v2New = 0;
                    end

                    x1New = x1(k-1) + 0.5*(v1Prev+v1New)*dtStep;
                    x2New = x2(k-1) + 0.5*(v2Prev+v2New)*dtStep;
                end

                % Save actual sliding distances before any contact-position correction.
                travel1 = abs(x1New-x1(k-1));
                travel2 = abs(x2New-x2(k-1));

                % First contact: point-mass collision when the centers meet.
                if ~collided && x1New >= x2New
                    collided = true;
                    collisionTime = t(k);
                    xc = 0.5*(x1New+x2New);
                    x1New = xc;
                    x2New = xc;

                    u1 = v1New;
                    u2 = v2New;
                    pBeforeCollision = m1*u1 + m2*u2;
                    KEbefore = 0.5*m1*u1^2 + 0.5*m2*u2^2;

                    v1New = ((m1-e*m2)*u1 + (1+e)*m2*u2)/(m1+m2);
                    v2New = ((1+e)*m1*u1 + (m2-e*m1)*u2)/(m1+m2);

                    pAfterCollision = m1*v1New + m2*v2New;
                    KEafter = 0.5*m1*v1New^2 + 0.5*m2*v2New^2;
                    internalLoss(k) = internalLoss(k-1) + max(0,KEbefore-KEafter);
                else
                    internalLoss(k) = internalLoss(k-1);
                end

                thermal(k) = thermal(k-1) + mu*m1*g*travel1 + mu*m2*g*travel2;

                x1(k) = x1New;
                x2(k) = x2New;
                v1(k) = v1New;
                v2(k) = v2New;
                last = k;

                switch stopType
                    case 'time'
                        reached = t(k) >= stopValue - 1e-12;
                    case 'object 1 position'
                        reached = (x1(k-1)-stopValue)*(x1(k)-stopValue) <= 0;
                    case 'object 1 velocity'
                        reached = (v1(k-1)-stopValue)*(v1(k)-stopValue) <= 0;
                    case 'object 2 position'
                        reached = (x2(k-1)-stopValue)*(x2(k)-stopValue) <= 0;
                    case 'object 2 velocity'
                        reached = (v2(k-1)-stopValue)*(v2(k)-stopValue) <= 0;
                end
            end

            t = t(1:last);
            x1 = x1(1:last);
            x2 = x2(1:last);
            v1 = v1(1:last);
            v2 = v2(1:last);
            thermal = thermal(1:last);
            internalLoss = internalLoss(1:last);

            p1 = m1*v1;
            p2 = m2*v2;
            pTotal = p1+p2;
            KE1 = 0.5*m1*v1.^2;
            KE2 = 0.5*m2*v2.^2;
            KEtotal = KE1+KE2;
            accountedEnergy = KEtotal + thermal + internalLoss;
            maxEnergyError = max(abs(accountedEnergy-accountedEnergy(1)));

            % Position graph.
            cla(app.position_graph_2)
            plot(app.position_graph_2,t,x1,'LineWidth',2)
            hold(app.position_graph_2,'on')
            plot(app.position_graph_2,t,x2,'LineWidth',2)
            hold(app.position_graph_2,'off')
            title(app.position_graph_2,'Object Position vs Time')
            xlabel(app.position_graph_2,'Time (s)')
            ylabel(app.position_graph_2,'Position (m)')
            legend(app.position_graph_2,{'Object 1','Object 2'},'Location','best')
            grid(app.position_graph_2,'on')

            % Speed graph.
            cla(app.speed_graph_2)
            plot(app.speed_graph_2,t,abs(v1),'LineWidth',2)
            hold(app.speed_graph_2,'on')
            plot(app.speed_graph_2,t,abs(v2),'LineWidth',2)
            hold(app.speed_graph_2,'off')
            title(app.speed_graph_2,'Object Speed vs Time')
            xlabel(app.speed_graph_2,'Time (s)')
            ylabel(app.speed_graph_2,'Speed (m/s)')
            legend(app.speed_graph_2,{'Object 1','Object 2'},'Location','best')
            grid(app.speed_graph_2,'on')

            % Combined momentum/energy teaching graph using two y-axes.
            axE = app.energy_graph_2;
            cla(axE)
            yyaxis(axE,'left')
            h1 = plot(axE,t,p1,'LineWidth',1.4);
            hold(axE,'on')
            h2 = plot(axE,t,p2,'LineWidth',1.4);
            h3 = plot(axE,t,pTotal,'LineWidth',2.2);
            ylabel(axE,'Momentum (kg m/s)')

            yyaxis(axE,'right')
            h4 = plot(axE,t,KEtotal,'LineWidth',1.5);
            h5 = plot(axE,t,thermal,'LineWidth',1.5);
            h6 = plot(axE,t,internalLoss,'LineWidth',1.5);
            h7 = plot(axE,t,accountedEnergy,'LineWidth',2.2);
            ylabel(axE,'Energy (J)')
            xlabel(axE,'Time (s)')
            if collided
                momentumJump = abs(pAfterCollision-pBeforeCollision);
                title(axE,sprintf('Momentum & Energy | |Delta p| %.2e | E err %.2e J',momentumJump,maxEnergyError))
            else
                title(axE,sprintf('Momentum & Energy | no collision | E err %.2e J',maxEnergyError))
            end
            legend(axE,[h1 h2 h3 h4 h5 h6 h7], ...
                {'p_1','p_2','p_{total}','Kinetic','Thermal','Collision/internal','Accounted energy'}, ...
                'Location','best')
            grid(axE,'on')
            hold(axE,'off')

            % Collision animation.
            ax = app.visualization_2;
            cla(ax)
            hold(ax,'on')
            xMin = min([x1 x2])-1;
            xMax = max([x1 x2])+1;
            if xMax-xMin < 4
                midX = 0.5*(xMin+xMax);
                xMin = midX-2;
                xMax = midX+2;
            end
            plot(ax,[xMin xMax],[0 0],'LineWidth',3)
            xlim(ax,[xMin xMax])
            ylim(ax,[-0.25 1.35])
            ax.XTick = [];
            ax.YTick = [];
            title(ax,sprintf('%s, e = %.2f',collisionType,e))

            w = 0.55;
            hObj1 = 0.45 + 0.15*min(1,m1/max(m1,m2));
            hObj2 = 0.45 + 0.15*min(1,m2/max(m1,m2));
            pink = [0.95 0.40 0.77];
            blue = [0.18 0.75 0.94];
            pObj1 = patch(ax,[-w/2 w/2 w/2 -w/2]+x1(1),[0 0 hObj1 hObj1],pink,'EdgeColor',[0.2 0.2 0.2]);
            pObj2 = patch(ax,[-w/2 w/2 w/2 -w/2]+x2(1),[0 0 hObj2 hObj2],blue,'EdgeColor',[0.2 0.2 0.2]);
            label1 = text(ax,x1(1),hObj1+0.08,'1','HorizontalAlignment','center');
            label2 = text(ax,x2(1),hObj2+0.08,'2','HorizontalAlignment','center');

            frameIdx = unique(round(linspace(1,numel(t),min(140,numel(t)))));
            for j = 1:numel(frameIdx)
                i = frameIdx(j);
                pObj1.XData = [-w/2 w/2 w/2 -w/2]+x1(i);
                pObj2.XData = [-w/2 w/2 w/2 -w/2]+x2(i);
                label1.Position = [x1(i) hObj1+0.08 0];
                label2.Position = [x2(i) hObj2+0.08 0];
                drawnow
            end
            hold(ax,'off')

            % Numerical results and conservation checks.
            app.InitialEEditField_2.Value = sprintf('%.3f kg m/s',pTotal(1));
            app.FinaltEditField_2.Value = sprintf('%.3f s',t(end));
            app.FinalxEditField_2.Value = sprintf('%.3f m',x1(end));
            app.FinalvEditField_2.Value = sprintf('%.3f m/s',v1(end));
            app.FinalKEEditField_2.Value = sprintf('%.3f m',x2(end));
            app.FinalPEEditField_2.Value = sprintf('%.3f m/s',v2(end));
            if collided
                app.FinalthermalEditField_2.Value = sprintf('%.2e',abs(pAfterCollision-pBeforeCollision));
                app.FinalEEditField_2.Value = sprintf('%.3f J',internalLoss(end));
            else
                app.FinalthermalEditField_2.Value = 'no collision';
                app.FinalEEditField_2.Value = '0 J';
            end

            % Keep a visible energy-accounting check in the graph title.
            if maxEnergyError > 1e-5*max(1,abs(accountedEnergy(1)))
                % Numerical integration can cause a small residual; this does
                % not replace the physical collision loss, which is plotted separately.
            end

            if ~reached && ~strcmp(stopType,'time')
                uialert(app.UIFigure, ...
                    'The requested final condition was not reached within 20 s. The displayed graphs show the simulated interval.', ...
                    'Condition Not Reached');
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 921 869];
            app.UIFigure.Name = 'EA3 Mechanics Study Lab';
            app.UIFigure.ButtonDownFcn = createCallbackFcn(app, @RunSlide, true);

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.Position = [23 18 881 840];

            % Create SlidingBoxTab
            app.SlidingBoxTab = uitab(app.TabGroup);
            app.SlidingBoxTab.Title = 'Sliding Box';

            % Create InitialandFinalConditionsPanel
            app.InitialandFinalConditionsPanel = uipanel(app.SlidingBoxTab);
            app.InitialandFinalConditionsPanel.Title = 'Initial Conditions / Numerical Results';
            app.InitialandFinalConditionsPanel.Position = [22 24 474 317];

            % Create InitialtEditFieldLabel
            app.InitialtEditFieldLabel = uilabel(app.InitialandFinalConditionsPanel);
            app.InitialtEditFieldLabel.HorizontalAlignment = 'right';
            app.InitialtEditFieldLabel.Position = [12 255 88 22];
            app.InitialtEditFieldLabel.Text = 'Initial t (s)';

            % Create InitialtEditField
            app.InitialtEditField = uieditfield(app.InitialandFinalConditionsPanel, 'text');
            app.InitialtEditField.Position = [117 254 100 22];

            % Create InitialxEditFieldLabel
            app.InitialxEditFieldLabel = uilabel(app.InitialandFinalConditionsPanel);
            app.InitialxEditFieldLabel.HorizontalAlignment = 'right';
            app.InitialxEditFieldLabel.Position = [12 214 88 22];
            app.InitialxEditFieldLabel.Text = 'Initial x (m)';

            % Create InitialxEditField
            app.InitialxEditField = uieditfield(app.InitialandFinalConditionsPanel, 'text');
            app.InitialxEditField.Position = [117 213 100 22];

            % Create InitialvEditFieldLabel
            app.InitialvEditFieldLabel = uilabel(app.InitialandFinalConditionsPanel);
            app.InitialvEditFieldLabel.HorizontalAlignment = 'right';
            app.InitialvEditFieldLabel.Position = [12 173 88 22];
            app.InitialvEditFieldLabel.Text = 'Initial v (m/s)';

            % Create InitialvEditField
            app.InitialvEditField = uieditfield(app.InitialandFinalConditionsPanel, 'text');
            app.InitialvEditField.Position = [117 172 100 22];

            % Create InitialXEditField_2Label_2
            app.InitialXEditField_2Label_2 = uilabel(app.InitialandFinalConditionsPanel);
            app.InitialXEditField_2Label_2.HorizontalAlignment = 'right';
            app.InitialXEditField_2Label_2.Position = [26 132 52 22];
            app.InitialXEditField_2Label_2.Text = 'Initial KE';

            % Create InitialKEEditField
            app.InitialKEEditField = uieditfield(app.InitialandFinalConditionsPanel, 'text');
            app.InitialKEEditField.Position = [117 131 100 22];

            % Create InitialPEEditFieldLabel
            app.InitialPEEditFieldLabel = uilabel(app.InitialandFinalConditionsPanel);
            app.InitialPEEditFieldLabel.HorizontalAlignment = 'right';
            app.InitialPEEditFieldLabel.Position = [26 91 51 22];
            app.InitialPEEditFieldLabel.Text = 'Initial PE';

            % Create InitialPEEditField
            app.InitialPEEditField = uieditfield(app.InitialandFinalConditionsPanel, 'text');
            app.InitialPEEditField.Position = [117 90 100 22];

            % Create InitialthermalEditFieldLabel
            app.InitialthermalEditFieldLabel = uilabel(app.InitialandFinalConditionsPanel);
            app.InitialthermalEditFieldLabel.HorizontalAlignment = 'right';
            app.InitialthermalEditFieldLabel.Position = [26 51 77 22];
            app.InitialthermalEditFieldLabel.Text = 'Initial thermal';

            % Create InitialthermalEditField
            app.InitialthermalEditField = uieditfield(app.InitialandFinalConditionsPanel, 'text');
            app.InitialthermalEditField.Position = [117 50 100 22];

            % Create FinaltEditFieldLabel
            app.FinaltEditFieldLabel = uilabel(app.InitialandFinalConditionsPanel);
            app.FinaltEditFieldLabel.HorizontalAlignment = 'right';
            app.FinaltEditFieldLabel.Position = [255 254 37 22];
            app.FinaltEditFieldLabel.Text = 'Final t';

            % Create FinaltEditField
            app.FinaltEditField = uieditfield(app.InitialandFinalConditionsPanel, 'text');
            app.FinaltEditField.Position = [345 254 100 22];

            % Create FinalxEditFieldLabel
            app.FinalxEditFieldLabel = uilabel(app.InitialandFinalConditionsPanel);
            app.FinalxEditFieldLabel.HorizontalAlignment = 'right';
            app.FinalxEditFieldLabel.Position = [255 213 40 22];
            app.FinalxEditFieldLabel.Text = 'Final x';

            % Create FinalxEditField
            app.FinalxEditField = uieditfield(app.InitialandFinalConditionsPanel, 'text');
            app.FinalxEditField.Position = [345 213 100 22];

            % Create FinalvEditFieldLabel
            app.FinalvEditFieldLabel = uilabel(app.InitialandFinalConditionsPanel);
            app.FinalvEditFieldLabel.HorizontalAlignment = 'right';
            app.FinalvEditFieldLabel.Position = [255 172 40 22];
            app.FinalvEditFieldLabel.Text = 'Final v';

            % Create FinalvEditField
            app.FinalvEditField = uieditfield(app.InitialandFinalConditionsPanel, 'text');
            app.FinalvEditField.Position = [345 172 100 22];

            % Create InitialXEditField_2Label_3
            app.InitialXEditField_2Label_3 = uilabel(app.InitialandFinalConditionsPanel);
            app.InitialXEditField_2Label_3.HorizontalAlignment = 'right';
            app.InitialXEditField_2Label_3.Position = [255 131 49 22];
            app.InitialXEditField_2Label_3.Text = 'Final KE';

            % Create FinalKEEditField
            app.FinalKEEditField = uieditfield(app.InitialandFinalConditionsPanel, 'text');
            app.FinalKEEditField.Position = [345 131 100 22];

            % Create FinalPEEditFieldLabel
            app.FinalPEEditFieldLabel = uilabel(app.InitialandFinalConditionsPanel);
            app.FinalPEEditFieldLabel.HorizontalAlignment = 'right';
            app.FinalPEEditFieldLabel.Position = [255 90 49 22];
            app.FinalPEEditFieldLabel.Text = 'Final PE';

            % Create FinalPEEditField
            app.FinalPEEditField = uieditfield(app.InitialandFinalConditionsPanel, 'text');
            app.FinalPEEditField.Position = [345 90 100 22];

            % Create FinalthermalEditFieldLabel
            app.FinalthermalEditFieldLabel = uilabel(app.InitialandFinalConditionsPanel);
            app.FinalthermalEditFieldLabel.HorizontalAlignment = 'right';
            app.FinalthermalEditFieldLabel.Position = [255 50 74 22];
            app.FinalthermalEditFieldLabel.Text = 'Final thermal';

            % Create FinalthermalEditField
            app.FinalthermalEditField = uieditfield(app.InitialandFinalConditionsPanel, 'text');
            app.FinalthermalEditField.Position = [345 50 100 22];

            % Create InitialEEditFieldLabel_2
            app.InitialEEditFieldLabel_2 = uilabel(app.InitialandFinalConditionsPanel);
            app.InitialEEditFieldLabel_2.HorizontalAlignment = 'right';
            app.InitialEEditFieldLabel_2.Position = [26 11 44 22];
            app.InitialEEditFieldLabel_2.Text = 'Initial E';

            % Create InitialEEditField
            app.InitialEEditField = uieditfield(app.InitialandFinalConditionsPanel, 'text');
            app.InitialEEditField.Position = [117 10 100 22];

            % Create FinalEEditFieldLabel
            app.FinalEEditFieldLabel = uilabel(app.InitialandFinalConditionsPanel);
            app.FinalEEditFieldLabel.HorizontalAlignment = 'right';
            app.FinalEEditFieldLabel.Position = [255 10 41 22];
            app.FinalEEditFieldLabel.Text = 'Final E';

            % Create FinalEEditField
            app.FinalEEditField = uieditfield(app.InitialandFinalConditionsPanel, 'text');
            app.FinalEEditField.Position = [345 10 100 22];

            % Create VisualizationPanel
            app.VisualizationPanel = uipanel(app.SlidingBoxTab);
            app.VisualizationPanel.Title = 'Visualization';
            app.VisualizationPanel.Position = [22 360 474 208];

            % Create visualization
            app.visualization = uiaxes(app.VisualizationPanel);
            app.visualization.FontName = 'Ayuthaya';
            app.visualization.XTick = [];
            app.visualization.YTick = [];
            app.visualization.Position = [40 16 393 144];

            % Create InputsPanel
            app.InputsPanel = uipanel(app.SlidingBoxTab);
            app.InputsPanel.Title = 'Inputs';
            app.InputsPanel.Position = [22 587 500 216];

            % Create RunButton
            app.RunButton = uibutton(app.InputsPanel, 'push');
            app.RunButton.ButtonPushedFcn = createCallbackFcn(app, @RunButtonPushed, true);
            app.RunButton.IconAlignment = 'center';
            app.RunButton.WordWrap = 'on';
            app.RunButton.BackgroundColor = [0.949 0.4039 0.7725];
            app.RunButton.FontName = 'Ayuthaya';
            app.RunButton.FontSize = 20;
            app.RunButton.FontWeight = 'bold';
            app.RunButton.FontColor = [0 0 0];
            app.RunButton.Position = [307 37 150 132];
            app.RunButton.Text = 'Run Simulation';

            % Create xaxisDropDownLabel
            app.xaxisDropDownLabel = uilabel(app.InputsPanel);
            app.xaxisDropDownLabel.HorizontalAlignment = 'right';
            app.xaxisDropDownLabel.FontName = 'Ayuthaya';
            app.xaxisDropDownLabel.FontColor = [1 1 1];
            app.xaxisDropDownLabel.Position = [12 168 55 22];
            app.xaxisDropDownLabel.Text = 'x-axis ';

            % Create xaxis
            app.xaxis = uidropdown(app.InputsPanel);
            app.xaxis.Items = {'along the ground', 'along the ramp'};
            app.xaxis.FontName = 'Ayuthaya';
            app.xaxis.FontColor = [0 0 0];
            app.xaxis.BackgroundColor = [0.1843 0.7451 0.9373];
            app.xaxis.Position = [82 168 160 22];
            app.xaxis.Value = 'along the ramp';

            % Create CoefficientoffrictionEditFieldLabel
            app.CoefficientoffrictionEditFieldLabel = uilabel(app.InputsPanel);
            app.CoefficientoffrictionEditFieldLabel.HorizontalAlignment = 'right';
            app.CoefficientoffrictionEditFieldLabel.FontName = 'Ayuthaya';
            app.CoefficientoffrictionEditFieldLabel.Position = [13 132 163 22];
            app.CoefficientoffrictionEditFieldLabel.Text = 'Coefficient of friction';

            % Create u
            app.u = uieditfield(app.InputsPanel, 'numeric');
            app.u.FontColor = [0.1843 0.7451 0.9373];
            app.u.Position = [192 132 100 22];

            % Create MasskgEditFieldLabel
            app.MasskgEditFieldLabel = uilabel(app.InputsPanel);
            app.MasskgEditFieldLabel.HorizontalAlignment = 'right';
            app.MasskgEditFieldLabel.FontName = 'Ayuthaya';
            app.MasskgEditFieldLabel.Position = [13 108 70 22];
            app.MasskgEditFieldLabel.Text = 'Mass (kg)';

            % Create m
            app.m = uieditfield(app.InputsPanel, 'numeric');
            app.m.FontColor = [0.1843 0.7451 0.9373];
            app.m.Position = [192 108 100 22];

            % Create RampangledegreesEditFieldLabel
            app.RampangledegreesEditFieldLabel = uilabel(app.InputsPanel);
            app.RampangledegreesEditFieldLabel.HorizontalAlignment = 'right';
            app.RampangledegreesEditFieldLabel.FontName = 'Ayuthaya';
            app.RampangledegreesEditFieldLabel.Position = [13 81 149 22];
            app.RampangledegreesEditFieldLabel.Text = 'Ramp angle (degrees)';

            % Create theta
            app.theta = uieditfield(app.InputsPanel, 'numeric');
            app.theta.FontColor = [0.1843 0.7451 0.9373];
            app.theta.Position = [192 81 100 22];

            % Create StopsimulationwhenDropDownLabel
            app.StopsimulationwhenDropDownLabel = uilabel(app.InputsPanel);
            app.StopsimulationwhenDropDownLabel.HorizontalAlignment = 'right';
            app.StopsimulationwhenDropDownLabel.FontName = 'Ayuthaya';
            app.StopsimulationwhenDropDownLabel.Position = [14 42 149 22];
            app.StopsimulationwhenDropDownLabel.Text = 'Stop simulation when';

            % Create stop_type
            app.stop_type = uidropdown(app.InputsPanel);
            app.stop_type.Items = {'position', 'velocity', 'time'};
            app.stop_type.FontName = 'Ayuthaya';
            app.stop_type.FontColor = [0 0 0];
            app.stop_type.BackgroundColor = [0.1843 0.7451 0.9373];
            app.stop_type.Position = [175 43 112 22];
            app.stop_type.Value = 'position';

            % Create Label
            app.Label = uilabel(app.InputsPanel);
            app.Label.HorizontalAlignment = 'right';
            app.Label.Position = [155 12 25 22];
            app.Label.Text = '=';

            % Create stop_value
            app.stop_value = uieditfield(app.InputsPanel, 'numeric');
            app.stop_value.FontColor = [0.1843 0.7451 0.9373];
            app.stop_value.Position = [187 12 100 22];

            % Create GraphsPanel
            app.GraphsPanel = uipanel(app.SlidingBoxTab);
            app.GraphsPanel.Title = 'Graphs';
            app.GraphsPanel.Position = [519 18 334 781];

            % Create position_graph
            app.position_graph = uiaxes(app.GraphsPanel);
            title(app.position_graph, 'Position vs Time ')
            xlabel(app.position_graph, 'Time')
            ylabel(app.position_graph, 'Position')
            zlabel(app.position_graph, 'Z')
            app.position_graph.FontName = 'Ayuthaya';
            app.position_graph.Position = [24 532 273 185];

            % Create speed_graph
            app.speed_graph = uiaxes(app.GraphsPanel);
            title(app.speed_graph, 'Speed vs Time ')
            xlabel(app.speed_graph, 'Time (s)')
            ylabel(app.speed_graph, 'Speed')
            zlabel(app.speed_graph, 'Z')
            app.speed_graph.FontName = 'Ayuthaya';
            app.speed_graph.Position = [23 296 273 185];

            % Create energy_graph
            app.energy_graph = uiaxes(app.GraphsPanel);
            title(app.energy_graph, 'Energy vs Time ')
            xlabel(app.energy_graph, 'Time')
            ylabel(app.energy_graph, 'Energy')
            zlabel(app.energy_graph, 'Z')
            app.energy_graph.FontName = 'Ayuthaya';
            app.energy_graph.Position = [24 67 273 185];

            % Create CollisionTab_2
            app.CollisionTab_2 = uitab(app.TabGroup);
            app.CollisionTab_2.Title = 'Collision';

            % Create InitialandFinalConditionsPanel_2
            app.InitialandFinalConditionsPanel_2 = uipanel(app.CollisionTab_2);
            app.InitialandFinalConditionsPanel_2.Title = 'Collision Initial Conditions / Results';
            app.InitialandFinalConditionsPanel_2.Position = [22 24 474 317];

            % Create InitialtEditField_2Label
            app.InitialtEditField_2Label = uilabel(app.InitialandFinalConditionsPanel_2);
            app.InitialtEditField_2Label.HorizontalAlignment = 'right';
            app.InitialtEditField_2Label.Position = [12 255 88 22];
            app.InitialtEditField_2Label.Text = 'g (m/s^2)';

            % Create InitialtEditField_2
            app.InitialtEditField_2 = uieditfield(app.InitialandFinalConditionsPanel_2, 'text');
            app.InitialtEditField_2.Position = [117 254 100 22];

            % Create InitialxEditField_2Label
            app.InitialxEditField_2Label = uilabel(app.InitialandFinalConditionsPanel_2);
            app.InitialxEditField_2Label.HorizontalAlignment = 'right';
            app.InitialxEditField_2Label.Position = [12 214 88 22];
            app.InitialxEditField_2Label.Text = 'x1(0) (m)';

            % Create InitialxEditField_2
            app.InitialxEditField_2 = uieditfield(app.InitialandFinalConditionsPanel_2, 'text');
            app.InitialxEditField_2.Position = [117 213 100 22];

            % Create InitialvEditField_2Label
            app.InitialvEditField_2Label = uilabel(app.InitialandFinalConditionsPanel_2);
            app.InitialvEditField_2Label.HorizontalAlignment = 'right';
            app.InitialvEditField_2Label.Position = [12 173 88 22];
            app.InitialvEditField_2Label.Text = 'v1(0) (m/s)';

            % Create InitialvEditField_2
            app.InitialvEditField_2 = uieditfield(app.InitialandFinalConditionsPanel_2, 'text');
            app.InitialvEditField_2.Position = [117 172 100 22];

            % Create InitialKEEditField_2Label
            app.InitialKEEditField_2Label = uilabel(app.InitialandFinalConditionsPanel_2);
            app.InitialKEEditField_2Label.HorizontalAlignment = 'right';
            app.InitialKEEditField_2Label.Position = [12 132 88 22];
            app.InitialKEEditField_2Label.Text = 'x2(0) (m)';

            % Create InitialKEEditField_2
            app.InitialKEEditField_2 = uieditfield(app.InitialandFinalConditionsPanel_2, 'text');
            app.InitialKEEditField_2.Position = [117 131 100 22];

            % Create InitialPEEditField_2Label
            app.InitialPEEditField_2Label = uilabel(app.InitialandFinalConditionsPanel_2);
            app.InitialPEEditField_2Label.HorizontalAlignment = 'right';
            app.InitialPEEditField_2Label.Position = [12 91 88 22];
            app.InitialPEEditField_2Label.Text = 'v2(0) (m/s)';

            % Create InitialPEEditField_2
            app.InitialPEEditField_2 = uieditfield(app.InitialandFinalConditionsPanel_2, 'text');
            app.InitialPEEditField_2.Position = [117 90 100 22];

            % Create InitialthermalEditField_2Label
            app.InitialthermalEditField_2Label = uilabel(app.InitialandFinalConditionsPanel_2);
            app.InitialthermalEditField_2Label.HorizontalAlignment = 'right';
            app.InitialthermalEditField_2Label.Position = [12 51 88 22];
            app.InitialthermalEditField_2Label.Text = 'Restitution e';

            % Create InitialthermalEditField_2
            app.InitialthermalEditField_2 = uieditfield(app.InitialandFinalConditionsPanel_2, 'text');
            app.InitialthermalEditField_2.Position = [117 50 100 22];

            % Create FinaltEditField_2Label
            app.FinaltEditField_2Label = uilabel(app.InitialandFinalConditionsPanel_2);
            app.FinaltEditField_2Label.HorizontalAlignment = 'right';
            app.FinaltEditField_2Label.Position = [255 254 37 22];
            app.FinaltEditField_2Label.Text = 'Final t';

            % Create FinaltEditField_2
            app.FinaltEditField_2 = uieditfield(app.InitialandFinalConditionsPanel_2, 'text');
            app.FinaltEditField_2.Position = [345 254 100 22];

            % Create FinalxEditField_2Label
            app.FinalxEditField_2Label = uilabel(app.InitialandFinalConditionsPanel_2);
            app.FinalxEditField_2Label.HorizontalAlignment = 'right';
            app.FinalxEditField_2Label.Position = [255 213 40 22];
            app.FinalxEditField_2Label.Text = 'Final x1';

            % Create FinalxEditField_2
            app.FinalxEditField_2 = uieditfield(app.InitialandFinalConditionsPanel_2, 'text');
            app.FinalxEditField_2.Position = [345 213 100 22];

            % Create FinalvEditField_2Label
            app.FinalvEditField_2Label = uilabel(app.InitialandFinalConditionsPanel_2);
            app.FinalvEditField_2Label.HorizontalAlignment = 'right';
            app.FinalvEditField_2Label.Position = [255 172 40 22];
            app.FinalvEditField_2Label.Text = 'Final v1';

            % Create FinalvEditField_2
            app.FinalvEditField_2 = uieditfield(app.InitialandFinalConditionsPanel_2, 'text');
            app.FinalvEditField_2.Position = [345 172 100 22];

            % Create FinalKEEditField_2Label
            app.FinalKEEditField_2Label = uilabel(app.InitialandFinalConditionsPanel_2);
            app.FinalKEEditField_2Label.HorizontalAlignment = 'right';
            app.FinalKEEditField_2Label.Position = [255 131 49 22];
            app.FinalKEEditField_2Label.Text = 'Final x2';

            % Create FinalKEEditField_2
            app.FinalKEEditField_2 = uieditfield(app.InitialandFinalConditionsPanel_2, 'text');
            app.FinalKEEditField_2.Position = [345 131 100 22];

            % Create FinalPEEditField_2Label
            app.FinalPEEditField_2Label = uilabel(app.InitialandFinalConditionsPanel_2);
            app.FinalPEEditField_2Label.HorizontalAlignment = 'right';
            app.FinalPEEditField_2Label.Position = [255 90 49 22];
            app.FinalPEEditField_2Label.Text = 'Final v2';

            % Create FinalPEEditField_2
            app.FinalPEEditField_2 = uieditfield(app.InitialandFinalConditionsPanel_2, 'text');
            app.FinalPEEditField_2.Position = [345 90 100 22];

            % Create FinalthermalEditField_2Label
            app.FinalthermalEditField_2Label = uilabel(app.InitialandFinalConditionsPanel_2);
            app.FinalthermalEditField_2Label.HorizontalAlignment = 'right';
            app.FinalthermalEditField_2Label.Position = [255 50 74 22];
            app.FinalthermalEditField_2Label.Text = '|Delta p| coll.';

            % Create FinalthermalEditField_2
            app.FinalthermalEditField_2 = uieditfield(app.InitialandFinalConditionsPanel_2, 'text');
            app.FinalthermalEditField_2.Position = [345 50 100 22];

            % Create InitialEEditField_2Label
            app.InitialEEditField_2Label = uilabel(app.InitialandFinalConditionsPanel_2);
            app.InitialEEditField_2Label.HorizontalAlignment = 'right';
            app.InitialEEditField_2Label.Position = [12 11 88 22];
            app.InitialEEditField_2Label.Text = 'Initial total p';

            % Create InitialEEditField_2
            app.InitialEEditField_2 = uieditfield(app.InitialandFinalConditionsPanel_2, 'text');
            app.InitialEEditField_2.Position = [117 10 100 22];

            % Create FinalEEditField_2Label
            app.FinalEEditField_2Label = uilabel(app.InitialandFinalConditionsPanel_2);
            app.FinalEEditField_2Label.HorizontalAlignment = 'right';
            app.FinalEEditField_2Label.Position = [255 10 41 22];
            app.FinalEEditField_2Label.Text = 'Collision E loss';

            % Create FinalEEditField_2
            app.FinalEEditField_2 = uieditfield(app.InitialandFinalConditionsPanel_2, 'text');
            app.FinalEEditField_2.Position = [345 10 100 22];

            % Create VisualizationPanel_2
            app.VisualizationPanel_2 = uipanel(app.CollisionTab_2);
            app.VisualizationPanel_2.Title = 'Visualization';
            app.VisualizationPanel_2.Position = [22 360 474 208];

            % Create visualization_2
            app.visualization_2 = uiaxes(app.VisualizationPanel_2);
            app.visualization_2.FontName = 'Ayuthaya';
            app.visualization_2.XTick = [];
            app.visualization_2.YTick = [];
            app.visualization_2.Position = [40 16 393 144];

            % Create InputsPanel_2
            app.InputsPanel_2 = uipanel(app.CollisionTab_2);
            app.InputsPanel_2.Title = 'Inputs';
            app.InputsPanel_2.Position = [22 587 500 216];

            % Create RunButton_2
            app.RunButton_2 = uibutton(app.InputsPanel_2, 'push');
            app.RunButton_2.ButtonPushedFcn = createCallbackFcn(app, @RunCollisionButtonPushed, true);
            app.RunButton_2.IconAlignment = 'center';
            app.RunButton_2.WordWrap = 'on';
            app.RunButton_2.BackgroundColor = [0.949 0.4039 0.7725];
            app.RunButton_2.FontName = 'Ayuthaya';
            app.RunButton_2.FontSize = 20;
            app.RunButton_2.FontWeight = 'bold';
            app.RunButton_2.FontColor = [0 0 0];
            app.RunButton_2.Position = [307 37 150 132];
            app.RunButton_2.Text = 'Run Simulation';

            % Create xaxisDropDownLabel_2
            app.xaxisDropDownLabel_2 = uilabel(app.InputsPanel_2);
            app.xaxisDropDownLabel_2.HorizontalAlignment = 'right';
            app.xaxisDropDownLabel_2.FontName = 'Ayuthaya';
            app.xaxisDropDownLabel_2.FontColor = [1 1 1];
            app.xaxisDropDownLabel_2.Position = [12 168 92 22];
            app.xaxisDropDownLabel_2.Text = 'Collision type';

            % Create xaxis_2
            app.xaxis_2 = uidropdown(app.InputsPanel_2);
            app.xaxis_2.Items = {'Perfectly elastic', 'Perfectly inelastic', 'Imperfectly inelastic'};
            app.xaxis_2.FontName = 'Ayuthaya';
            app.xaxis_2.FontColor = [0 0 0];
            app.xaxis_2.BackgroundColor = [0.1843 0.7451 0.9373];
            app.xaxis_2.Position = [112 168 180 22];
            app.xaxis_2.Value = 'Perfectly elastic';

            % Create CoefficientoffrictionEditFieldLabel_2
            app.CoefficientoffrictionEditFieldLabel_2 = uilabel(app.InputsPanel_2);
            app.CoefficientoffrictionEditFieldLabel_2.HorizontalAlignment = 'right';
            app.CoefficientoffrictionEditFieldLabel_2.FontName = 'Ayuthaya';
            app.CoefficientoffrictionEditFieldLabel_2.Position = [13 132 163 22];
            app.CoefficientoffrictionEditFieldLabel_2.Text = 'Coefficient of friction';

            % Create u_2
            app.u_2 = uieditfield(app.InputsPanel_2, 'numeric');
            app.u_2.FontColor = [0.1843 0.7451 0.9373];
            app.u_2.Position = [192 132 100 22];

            % Create MasskgEditFieldLabel_2
            app.MasskgEditFieldLabel_2 = uilabel(app.InputsPanel_2);
            app.MasskgEditFieldLabel_2.HorizontalAlignment = 'right';
            app.MasskgEditFieldLabel_2.FontName = 'Ayuthaya';
            app.MasskgEditFieldLabel_2.Position = [13 108 70 22];
            app.MasskgEditFieldLabel_2.Text = 'Mass 1 (kg)';

            % Create m_2
            app.m_2 = uieditfield(app.InputsPanel_2, 'numeric');
            app.m_2.FontColor = [0.1843 0.7451 0.9373];
            app.m_2.Position = [192 108 100 22];

            % Create RampangledegreesEditFieldLabel_2
            app.RampangledegreesEditFieldLabel_2 = uilabel(app.InputsPanel_2);
            app.RampangledegreesEditFieldLabel_2.HorizontalAlignment = 'right';
            app.RampangledegreesEditFieldLabel_2.FontName = 'Ayuthaya';
            app.RampangledegreesEditFieldLabel_2.Position = [13 81 85 22];
            app.RampangledegreesEditFieldLabel_2.Text = 'Mass 2 (kg)';

            % Create theta_2
            app.theta_2 = uieditfield(app.InputsPanel_2, 'numeric');
            app.theta_2.FontColor = [0.1843 0.7451 0.9373];
            app.theta_2.Position = [192 81 100 22];

            % Create StopsimulationwhenDropDownLabel_2
            app.StopsimulationwhenDropDownLabel_2 = uilabel(app.InputsPanel_2);
            app.StopsimulationwhenDropDownLabel_2.HorizontalAlignment = 'right';
            app.StopsimulationwhenDropDownLabel_2.FontName = 'Ayuthaya';
            app.StopsimulationwhenDropDownLabel_2.Position = [14 42 126 22];
            app.StopsimulationwhenDropDownLabel_2.Text = 'Stop simulation when';

            % Create stop_type_2
            app.stop_type_2 = uidropdown(app.InputsPanel_2);
            app.stop_type_2.Items = {'time', 'object 1 position', 'object 1 velocity', 'object 2 position', 'object 2 velocity'};
            app.stop_type_2.FontName = 'Ayuthaya';
            app.stop_type_2.FontColor = [0 0 0];
            app.stop_type_2.BackgroundColor = [0.1843 0.7451 0.9373];
            app.stop_type_2.Position = [145 43 142 22];
            app.stop_type_2.Value = 'time';

            % Create Label_2
            app.Label_2 = uilabel(app.InputsPanel_2);
            app.Label_2.HorizontalAlignment = 'right';
            app.Label_2.Position = [155 12 25 22];
            app.Label_2.Text = '=';

            % Create stop_value_2
            app.stop_value_2 = uieditfield(app.InputsPanel_2, 'numeric');
            app.stop_value_2.FontColor = [0.1843 0.7451 0.9373];
            app.stop_value_2.Position = [187 12 100 22];

            % Create GraphsPanel_2
            app.GraphsPanel_2 = uipanel(app.CollisionTab_2);
            app.GraphsPanel_2.Title = 'Graphs';
            app.GraphsPanel_2.Position = [519 18 334 781];

            % Create position_graph_2
            app.position_graph_2 = uiaxes(app.GraphsPanel_2);
            title(app.position_graph_2, 'Position vs Time ')
            xlabel(app.position_graph_2, 'Time')
            ylabel(app.position_graph_2, 'Position')
            zlabel(app.position_graph_2, 'Z')
            app.position_graph_2.FontName = 'Ayuthaya';
            app.position_graph_2.Position = [24 532 273 185];

            % Create speed_graph_2
            app.speed_graph_2 = uiaxes(app.GraphsPanel_2);
            title(app.speed_graph_2, 'Speed vs Time ')
            xlabel(app.speed_graph_2, 'Time (s)')
            ylabel(app.speed_graph_2, 'Speed')
            zlabel(app.speed_graph_2, 'Z')
            app.speed_graph_2.FontName = 'Ayuthaya';
            app.speed_graph_2.Position = [23 296 273 185];

            % Create energy_graph_2
            app.energy_graph_2 = uiaxes(app.GraphsPanel_2);
            title(app.energy_graph_2, 'Momentum & Energy vs Time')
            xlabel(app.energy_graph_2, 'Time')
            ylabel(app.energy_graph_2, 'Energy')
            zlabel(app.energy_graph_2, 'Z')
            app.energy_graph_2.FontName = 'Ayuthaya';
            app.energy_graph_2.Position = [24 67 273 185];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = ea3hw1

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end