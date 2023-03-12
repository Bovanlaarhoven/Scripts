runservice.RenderStepped:Connect(function()
    if (lplr.Backpack and lplr.Backpack:FindFirstChild("Main") and lplr.PlayerScripts:FindFirstChild("Points") and getsenv(lplr.Backpack.Main)) then
        local pointsEnv = getsenv(lplr.PlayerScripts.Points);
        pointsEnv.changeParkourRemoteParent(workspace);
    
        local scoreRemote = getupvalue(pointsEnv.changeParkourRemoteParent, 2);
    
        scoreRemote:FireServer(encrypt("walljump"), {
            [encrypt("walljumpDelta")] = encrypt(tostring(math.random(2.02, 3.55)));
            [encrypt("combo")] = encrypt(tostring(math.random(4, 5)));
        });
    
        wait(0.4);
    
        scoreRemote:FireServer(encrypt(moves[math.random(1, #moves)]), {
            [encrypt("combo")] = encrypt(tostring(1));
        });
    
        wait(math.random(1.25, 1.35));
    end;
    wait();
    end)