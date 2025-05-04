if CLIENT then
    SWEP.Icon = "materials/icon/deathsmg.png"
end

SWEP.PrintName = "death357v2"
SWEP.Author = "りれみ"
SWEP.Instructions = "Left click to shoot, Right click for secondary attack."
SWEP.Category      = "death"
SWEP.Spawnable = true
SWEP.AdminOnly = true 
SWEP.ViewModel = "models/weapons/c_357.mdl" 
SWEP.WorldModel = "models/weapons/w_357.mdl"
SWEP.UseHands = true  


function SWEP:Initialize()
    self:SetHoldType("357")  
end

SWEP.DrawWorldModel = true  
SWEP.Primary.Sound = "weapons/deagle-1.wav"
SWEP.Primary.ClipSize = 6
SWEP.Primary.DefaultClip = 12 
SWEP.Primary.Automatic = true

SWEP.Primary.Ammo = "357"
SWEP.Primary.Delay = 1
SWEP.Primary.Recoil = 1
SWEP.Primary.Damage = 1000
SWEP.Primary.ClipSize = 6
SWEP.Primary.DefaultClip = 12
SWEP.Primary.Automatic = true

SWEP.Primary.Spread = 0
SWEP.Primary.SpreadAir = 0.1
SWEP.Primary.SpreadMove = 0.08

SWEP.Secondary.Ammo = "none"

function SWEP:PrimaryAttack()
    if self:Clip1() <= 0 then
        self:EmitSound("Weapon_357.Empty")
        return
    end

    local spread = self.Primary.Spread

    if self:GetOwner():KeyDown(IN_WALK) then
        spread = self.Primary.SpreadMove
    end

    if not self:GetOwner():OnGround() then
        spread = self.Primary.SpreadAir
    end

    self.Cone = spread

    self:EmitSound(self.Primary.Sound)
    self:ShootBullet(self.Primary.Damage, 1, spread)
    self:TakePrimaryAmmo(1)
    self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
end
function SWEP:DrawWorldModel()
    local owner = self:GetOwner()
    if IsValid(owner) then
        local model = self:GetModel()
        if model then
            self:SetModel(model)
            self:DrawModel()
        end
    end
end
