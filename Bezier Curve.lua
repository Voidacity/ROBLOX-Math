function drawLine(from, to)
	local dist = (to-from).magnitude
	local line = Instance.new("Part", workspace)
	line.Name = "Line"
	line.Anchored = true
	line.CanCollide = false
	line.TopSurface = "Smooth"
	line.BottomSurface = "Smooth"
	line.FormFactor = "Custom"
	line.Size = Vector3.new(0, 0, dist)
	line.CFrame = CFrame.new(from, to) * CFrame.new(0, 0, -dist/2)
end

 -- approx is a point in which the curve goes nearby but does not pass through it
 -- the further the approx point relative to from & to, the higher the curvature
function drawQuadLine(from, to, approx)
	local prevx, prevy, prevz
	for t = 0, 1, 0.01 do
		local x = (1-t)^2*from.X + 2*(1-t)*t*approx.X + t^2*to.X 
		local y = (1-t)^2*from.Y + 2*(1-t)*t*approx.Y + t^2*to.Y 
		local z = (1-t)^2*from.Z + 2*(1-t)*t*approx.Z + t^2*to.Z 
		if prevx then
			drawLine(Vector3.new(prevx,prevy,prevz),Vector3.new(x,y,z))
		end
		prevx, prevy, prevz = x, y, z
		wait()
	end
end

-- since cubic has two curves, we got 2 approx points
function drawCubicLine(from, to, approx, approx2)
	local prevx, prevy, prevz
	for t = 0, 1, 0.01 do
		local x = (1-t)^3*from.X + 3*(1-t)^2*t*approx.X + 3*(1-t)*t^2*approx2.X + t^3*to.X 
		local y = (1-t)^3*from.Y + 3*(1-t)^2*t*approx.Y + 3*(1-t)*t^2*approx2.Y + t^3*to.Y 
		local z = (1-t)^3*from.Z + 3*(1-t)^2*t*approx.Z + 3*(1-t)*t^2*approx2.Z + t^3*to.Z 
		if prevx then
			drawLine(Vector3.new(prevx,prevy,prevz),Vector3.new(x,y,z))
		end
		prevx, prevy, prevz = x, y, z
		wait()
	end
end


-- Sample Code
--[[

local v1 = Vector3.new(0,5,0)
local v2 = Vector3.new(10,5,10)
local approx = Vector3.new(3,-5,7)
local approx2 = Vector3.new(7,10,3)

drawCubicLine(v1, v2, approx, approx2)

--]]


