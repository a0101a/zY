---@diagnostic disable: param-type-mismatch, undefined-global, lowercase-global, undefined-field, redundant-parameter, missing-parameter, cast-local-type, assign-type-mismatch, redefined-local, unused-local
local YZ = {}
local YZPDKG = 0
-- 服务器
local url = 'https://baidu.com'
-- 拦截江苏
local ban = 0
-- 解码密钥
local key = 'lyjiaoben'


local Ly = {}

-- 文件储存
Cun = "/storage/emulated/0/Android/lengyipz/"

if file.check(Cun) == 0 then
    file.mkdir(Cun)
end


-- 修改器配置
gg.setConfig(2131427463, 0) -- 对游戏隐藏0
gg.setConfig(2131427464, 0) -- 旁路模式无
gg.setConfig(2131427465, 1) -- 跳过内存区域空
gg.setConfig(2131427466, 1) -- 快速冻结是
gg.setConfig(2131427467, 0) -- 冻结间隔0
gg.setConfig(2131427482, 0) -- 运行守护0
gg.setConfig(2131427475, 0) -- 内存缓冲0M

-- 进程判断
local GYBM, GYMC = "", ""
local sot = gg.getRangesList('libBootloader.so')[1]
if not sot then
    local jin = {{'com.netease.sky', "网易国服"}, {'com.netease.sky.mi', "小米渠道服"},
                 {'com.netease.sky.huawei', "华为渠道"}, {'com.netease.sky.vivo', "VIVO渠道服"},
                 {'com.netease.sky.nearme.gamecenter', "oppo渠道服"},
                 {'com.netease.sky.bilibili', "bilibili渠道服"}, {'com.netease.sky.aligames', "九游渠道服"},
                 {'com.tencent.tmgp.eyou.eygy', "应用宝渠道"}, {'com.netease.sky.m4399', "4399渠道服"},
                 {'com.netease.sky.aligames', "九游渠道服"}, {'com.tgc.sky.android', "国际服"},
                 {'com.tgc.sky.android.test.gold',"测试服"},{'com.tgc.sky.android.test.lymzg',"免资格"},
    { 'com.tencent.mmn',"专用测试框架" },
    {'com.tgc.sky.android.test.lyqwp',"全物品"}}
    for i = 1, #jin do
        gg.setProcess(jin[i][1])
        if not gg.getTargetInfo() then
            goto JC
        end
        if gg.getTargetInfo().cmdLine == jin[i][1] then
            GYBM = jin[i][1]
            GYMC = jin[i][2]
            gg.sleep(500)
            sot = gg.getRangesList('libBootloader.so')[1]
            gg.toast("已自动选择：" .. jin[i][2])
            break
        end
        ::JC::
    end
else
    gg.toast("检测到已选择光遇进程")
end
if not sot then
    print(
        "未识别到光遇进程\n请进入游戏后稍后重试")
    os.exit()
end

-- 应用so
for _, v in ipairs(gg.getRangesList('libBootloader.so')) do
    if v.state == 'Xa' then
        so = v.start
        break
    end
end
for _, v in ipairs(gg.getRangesList('libBootloader.so')) do
    if v.state == 'Cd' then
        so2 = v.start
        break
    end
end
-- 常用
Ly.sp = gg.sleep
Ly.tt = gg.toast
Ly.at = gg.alert
Ly.cd = gg.choice
Ly.mcd = gg.multiChoice
local SR = {"address", "flags", "value", "freeze"}

-- 指针
Ly.jz = function(a, b)
    local c = gg.getValues({{
        address = a + (b or 0),
        flags = 32
    }})[1].value
    return c
end

-- 表情生成
BQSC = function()
    local BQ = {}
    for i = 1, #BQRK do
        K = math.random(1, #BQRK)
        BQ[#BQ + 1] = BQRK[K]
    end
    return BQ
end

-- 二级菜单
Ly.Cdb = function(a, b)
    local SS = BQSC()
    local tmp = {}
    for k, v in pairs(a) do
        tmp[#tmp + 1] = {}
        tmp[#tmp] = SS[k] .. a[k][1] .. SS[k]
    end
    tmp[#tmp + 1] = "🚫返回上页🚫"
    local Cds = Ly.cd(tmp, nil, b)
    if Cds then
        if Cds == #tmp then
            FX = nil
            GNCD()
        else
            Ly.zxr(a[Cds][2])
        end
    end
end

-- 单地址修改
Ly.setv = function(a, b, c, d)
    local t = {}
    t[#t + 1] = {}
    t[#t][SR[1]] = a
    t[#t][SR[2]] = b
    if c then
        t[#t][SR[3]] = c
    end
    if d then
        t[#t][SR[4]] = d
    end
    Ly.set(t, d)
end

-- 多地址修改
Ly.setr = function(t, a, b, c, d)
    t[#t + 1] = {}
    t[#t][SR[1]] = a
    t[#t][SR[2]] = b
    if c then
        t[#t][SR[3]] = c
    end
    if d then
        t[#t][SR[4]] = d
    end
end

-- 单地址间隔修改
Ly.setk = function(a, b, c, d, e, f, g)
    local tmp = {}
    for i = a, b do
        Ly.setr(tmp, c + (i - 1) * d, e, f, g)
    end
    if g then
        Ly.set(tmp, g)
    else
        Ly.set(tmp)
    end
end

-- 获取单地址类型值
Ly.getv = function(a, b)
    local c = gg.getValues({{
        address = a,
        flags = b
    }})[1].value
    return c
end

-- 获取多地址类型值
Ly.getr = function(...)
    local a = {...}
    local b = {}
    for i = 1, #a do
        b[i] = gg.getValues({{
            address = a[i][1],
            flags = a[i][2]
        }})[1].value
    end
    return b
end

-- 特征码获取单个地址 
Ly.sedr = function(a)
    if not a[8] then
        a[8] = ""
    end
    gg.clearResults()
    if PZRK == true then
        if a[1] ~= 16384 then
            gg.setRanges(a[1] | -2080896)
        else
            gg.setRanges(a[1])
        end
    else
        gg.setRanges(a[1])
    end
    gg.searchNumber(a[2], a[3])
    local tmp = {}
    for k, v in ipairs(gg.getResults(gg.getResultCount())) do
        tmp[k] = {
            address = v.address + a[4],
            flags = a[5]
        }
    end
    for k, v in ipairs(gg.getValues(tmp)) do
        if v.value == a[6] then
            if a[9] then
                gg.clearResults()
                gg.searchNumber(a[9][2], a[9][3], false, gg.SIGN_EQUAL, v.address + a[7] - a[9][1],
                    v.address + a[7] + a[9][1])
                local tmk = {}
                for r, y in ipairs(gg.getResults(gg.getResultCount())) do
                    tmk[r] = {
                        address = y.address + a[9][4],
                        flags = a[9][5]
                    }
                end
                for r, y in ipairs(gg.getValues(tmk)) do
                    if y.value == a[9][6] then
                        return y.address + a[9][7]
                    end
                end
            else
                return v.address + a[7]
            end
        end
    end
    tt(a[8] .. "️获取失败")
end

-- 特征码获取多个地址
Ly.sedrs = function(...)
    local a = {...}
    gg.clearResults()
    local ret = {}
    gg.setRanges(a[1])
    gg.searchNumber(a[2], a[3])
    local tmp = {}
    for k, v in ipairs(gg.getResults(gg.getResultCount())) do
        tmp[k] = {
            address = v.address + a[4],
            flags = a[5]
        }
    end
    for _, v in ipairs(gg.getValues(tmp)) do
        if v.value == a[6] then
            ret[#ret + 1] = v.address + a[7]
        end
    end
    name = a[8] or ''
    if #ret == 0 then
        Ly.tt(name .. '地址定位失败')
        return nil
    else
        return ret
    end
end

-- 功能开关
KG = {}
for i = 1, 50 do
    KG[#KG + 1] = {}
    KG[#KG][1] = "关"
end

-- 单地址开关
Ly.KGR = function(KAI, a, b, c, d, e)
    if KAI[1] == "关" then
        KAI[2] = Ly.getv(a, b)
        if d then
            Ly.setv(a, b, c, d)
        else
            Ly.setv(a, b, c)
        end
        KAI[1] = "开"
        if not e then
            Ly.tt("开启")
        end
    else
        if d then
            Ly.setv(a, b, KAI[2], false)
        else
            Ly.setv(a, b, KAI[2])
        end
        KAI[1] = "关"
        if not e then
            Ly.tt("关闭")
        end
    end
end

-- 多地址开关
Ly.KGS = function(KAI, a, b, c, d, e, f, g)
    if KAI[1] == "关" then
        for i = a, b do
            KAI[1 + i] = Ly.getv(c + (i - 1) * e, d)
        end
        tmp = {}
        for i = a, b do
            if g then
                Ly.setr(tmp, c + (i - 1) * e, d, f, g)
            else
                Ly.setr(tmp, c + (i - 1) * e, d, f)
            end
        end
        Ly.set(tmp, g)
        KAI[1] = "开"
        Ly.tt("开启")
    else
        tmp = {}
        for i = a, b do
            if g then
                Ly.setr(tmp, c + (i - 1) * e, d, KAI[1 + i], false)
            else
                Ly.setr(tmp, c + (i - 1) * e, d, KAI[1 + i])
            end
        end
        Ly.set(tmp, false)
        KAI[1] = "关"
        Ly.tt("关闭")
    end
end

-- 地址文本段获取
WBEN = function(AD, BD)
    local WB, JC = "", 0
    if BD then
        for i = 0, BD do
            if Ly.getv(AD + JC, 1) ~= 0 then
                local AS = Ly.getv(AD + JC, 1)
                if AS >= 0 then
                    WB = WB .. string.char((AS))
                else
                    WB = WB .. string.char((AS + 256))
                end
            end
            JC = JC + 1
        end
    else
        while Ly.getv(AD + JC, 1) ~= 0 do
            local AS = Ly.getv(AD + JC, 1)
            if AS >= 0 then
                WB = WB .. string.char((AS))
            else
                WB = WB .. string.char((AS + 256))
            end
            JC = JC + 1
        end
    end
    return WB
end

-- 应用修改
Ly.set = function(a, b)
    if b == false then
        gg.removeListItems(a)
        gg.setValues(a)
    elseif b == true then
        gg.addListItems(a)
    else
        gg.setValues(a)
    end
end

-- 创建读取配置
CJPZ = function(A, B, C)
    local Pei
    if not io.open(Cun .. A, "r") then
        Ly.xrwj(Cun .. A, B, C)
        Ly.tt("配置初始化")
        Pei = Ly.bddq(Cun .. A)
    else
        Pei = Ly.bddq(Cun .. A)
    end
    return Pei
end

-- 返回文件表单
WJPZ = function(A)
    local LJ = '{' .. Ly.bddq(Cun .. A) .. '}'
    return load("return " .. LJ)()
end

-- 开关状态
A = function(x)
    return KG[x][1]
end

-- 执行函数
Ly.zxr = function(a)
    load(a .. "()")()
    return nil
end

-- 模糊搜索
sousk = function(a, b)
    return string.find(a, b) or false
end

-- 坐标匹配
ZBK = function(S)
    local XYZ, K = {}, 0
    for i in string.gmatch(S, '(%-?%d+%.?%d*)') do
        XYZ[#XYZ + 1] = string.format("%3f", i)
    end
    if XYZ[3] then
        K = XYZ
    end
    return K
end

-- 读取网页内容
Ly.wydq = function(a)
    local b = gg.makeRequest(a).content
    return b
end

-- 读取本地文件内容
Ly.bddq = function(a)
    local b = io.open(a):read("*a")
    return b
end

-- 写入本地文件内容
Ly.xrwj = function(a, b, c)
    io.open(a, b):write(c):close()
end

-- 执行云脚本
Ly.load = function(sr)
    pcall(load(gg.makeRequest(sr).content))
end

-- 读取云文本
Ly.make = function(sr)
    return gg.makeRequest(sr).content
end

Ly.load("https://pan.axxpan.com/api/v3/file/get/32232/%E6%95%B0%E7%BB%84.lua?sign=5cGF85QU_P0TK5ETg_kdbiFpVLOdC9FpO7tHn1_W0xw%3D%3A0")
Ly.load("https://pan.axxpan.com/api/v3/file/get/32233/CDMB.lua?sign=pmA8lnCHcSMj6Z8etrIXPTCpM6r8iRPvXpGSx_3CgqA%3D%3A0")

if YDBB ~= 31 then
    Ly.tt("版本不匹配")
    os.exit()
end

-- 用法Ly.py(基址，国服偏移，国际服偏移)
Ly.py = function(a, b, c)
    if not c then
        c = b
    end
    if GJF == 1 then
        k = a + c
    else
        k = a + b
    end
    return k
end

-- 用法Ly.pdpy(国服偏移，国际服偏移)
Ly.pypd = function(a, b)
    if not b then
        b = a
    end
    if GJF == 1 then
        k = b
    else
        k = a
    end
    return k
end

-- 偏移(*为国服修复)（+为国际服修复）
BYPD = 0
Ly.pyi = function()
    if gg.getTargetInfo().label == "Sky" then
        Ly.tt("已适配国际服")
        GJF = 1
    end
    sddz = Ly.pypd((Ly.jz(so, 0x16CEB20) + 0x1C8), (Ly.jz(so, 0x180A558) + 0xC4)) -- *+
    rwdz = Ly.pypd((Ly.jz(sddz, 0x8F67E0) - 0x4), (Ly.jz(sddz, 0x49EAF4) - 0x4)) -- *+
    -- CD
    TYQH = Ly.py(so2, 0x147190, 0x138AB0) -- 跳跃强化*+
    FXQH = Ly.py(so2, 0x147080, 0x1389A0) -- 飞行强化*+
    HJSD = Ly.py(so2, 0x126BBC, 0x118E40) -- 环境色调*+
    -- XA
    quanwup = Ly.py(so, 0x443F47, 0x3FAEB7) -- 全物品*+
    Q_head = Ly.py(so, 0x59C040, 0x5414D8) -- ios耳机*+
    youyi = Ly.py(so, 0x8F16D4, 0x874684) -- xa友谊树*+
    dundz = Ly.py(so, 0xD7EE84, 0xC9FECC) -- xa遁地*+
    dhzh = Ly.py(so, 0x775E84, 0x70A45C) -- 点蜡烛*+
    xilazr = Ly.py(so, 0x14BB204, 0x1296624) -- 吸花吸火*+
    -- sddz
    jiasuaddr = Ly.pypd((Ly.jz(Ly.jz(sddz))), sddz) -- 加速*+
    WXFZ = Ly.py(sddz, 0x75EB6C, 0x306F20) -- 无限放置*+
    fengq = Ly.py(sddz, 0x1355788, 0xD95B2C) -- 风墙*+
    fayan = Ly.py(sddz, 0x27FF1A4, 0x2233D68) -- 发言系统*+
    kydpds = Ly.py(sddz, 0x28B9B7C, 0x22E9DB0) -- 原地跑图*+
    pykr = {0x219974, 0x23F00C, 0x244D8C, 0x26E3EC, 0x26E6B4, 0x26ED88} -- *
    ksydrw = Ly.py(sddz, 0x680C98, 0x22904C) -- 原地任务*+
    SHPY = Ly.py(sddz, 0x2A4090C, 0x2470B40) -- 烧花偏移*+
    Any_daddr = Ly.py(sddz, 0x1BCF744, 0x160F818) -- 任意门*+
    xhaddrs = Ly.py(sddz, 0x8FFDE8, 0x4A80FC) -- 本人ID地址*+
    wjjg = Ly.pypd(0xD7A0) -- 玩家间隔*+
    wjgy = Ly.pypd(-0x40) -- 玩家光翼*+
    wjjg2 = Ly.pypd(-0x250) -- 玩家装扮*+
    WJSG = Ly.pypd(-0x210) -- 玩家身高*+
    WJZB = Ly.pypd(-0x200) -- 玩家坐标*+
    new_lookaddr = Ly.py(sddz, 0x280C0D8, 0x223F3BC) -- 窗口窥屏*+
    KPJG1 = Ly.pypd(-0x3788, -0x3784) -- 窥屏间隔1*+
    KPJG2 = Ly.pypd(-0x33C, -0x338) -- 窥屏间隔2*+
    daoli = Ly.py(sddz, 0x8EC2AC, 0x4945C0) -- 倒立地址*+
    luzhikg = Ly.py(sddz, 0x28B2B94, 0x20CFB20) -- 免费录制*
    MENS = Ly.py(sddz, 0x21103BC, 0x1B4B0E0) -- 门开关*+
    WBPD = Ly.py(sddz, 0x466D18, 0x59860) -- 文本判断*+
    FBLS = Ly.py(sddz, -0x1A3B98, -0x1A4320) -- 分辨率地址*+
    QIANSA = Ly.py(sddz, 0x28BCFC8, 0x22ED1FC) -- 强制牵手*+
    -- 发包提交
    fbcw = Ly.py(sddz, 0x400A58, 0xA4C) -- 地址提交*+
    fbdz = Ly.py(rwdz, -0x21900C, -0x208B4C) -- 送心火*+
    sxdz = Ly.py(rwdz, -0x2192AC, -0x208DDC) -- 送爱心*+
    shouxinh = Ly.py(fbdz, 0xA0) -- 收心火*
    shouax = Ly.py(fbdz, -0x200) -- 收爱心*
    AXID = Ly.py(rwdz, -0x8099C) -- 爱心id*
    xinhid = Ly.py(rwdz, -0x74694, -0x63F44) -- 心火id*
    laheihy = Ly.py(rwdz, -0x2196CC, -0x2025EC) -- 拉黑*
    yd_pd = Ly.py(rwdz, -0x2309BC, -0x21F3EC) -- 原地跑道*+
    YDSK = Ly.py(rwdz, -0x22FD5C, -0x21E78C) -- 神龛*+
    zdxz = Ly.py(rwdz, -0x230D8C, -0x21F6CC) -- 自动先祖*+
    KXZID = Ly.py(rwdz, -0x16AB64, -0x162A14) -- 先祖ID*+
    YD_XJ = Ly.py(rwdz, -0x2298CC, -0x2182FC) -- 献祭*+
    YD_GY = Ly.py(rwdz, -0x229A2C, -0x21845C) -- 光翼*+
    YD_HONGLAZHU = Ly.py(rwdz, -0x22981C, -0x21824C) -- 收取红蜡烛*+
    huoqurw = Ly.py(rwdz, -0x1E18CC, -0x1D16EC) -- 任务获取58*+
    jieshourw = Ly.py(rwdz, -0x230CDC, -0x21F61C) -- 接受任务58*+
    xiugairw = Ly.py(rwdz, -0x23077C, -0x21F1AC) -- 完成任务58*+
    tijiaorw = Ly.py(rwdz, -0x230C5C, -0x21F5AC) -- 提交任务70*+
    MFYZ = Ly.py(rwdz, -0x218A9C, -0x2085DC) -- 魔法兑换验证*+
    HQMF = Ly.py(rwdz, -0x21EB6C, -0x20D5BC) -- 魔法兑换*+
    XZDZ = Ly.py(rwdz, -0x230EBC, -0x21F7FC) -- 先祖动作*+
    Jg = Ly.pypd(0x58) -- 间隔1*
    Jr = Ly.pypd(0x70) -- 间隔2*
    Jo = Ly.pypd(0x1B0, 0x170) -- 发包间隔3*
    -- rwdz
    ZHONL = Ly.py(rwdz, 0x143F8, 0x11FF4) -- 重力*+
    TXXG = Ly.py(rwdz, 0x87D4) -- 体型修改*
    SMZT = Ly.py(rwdz, 0x9A84, 0x9A54) -- 睡眠状态*+
    SYLD = Ly.py(rwdz, -0x5E1A0, -0x5A150) -- 闪耀亮度*+
    ssygk = Ly.py(rwdz, 0x1226238, 0x11A0DA8) -- 衣柜开关*+
    rwys = Ly.py(rwdz, 0x1EF0) -- 隐身*+
    fjrs = Ly.py(rwdz, -0x24D46C, -0x2370AC) -- 房间人数*+
    fjsx = Ly.py(rwdz, -0x23E5E8, -0x2285A8) -- 房间刷新*+
    py = Ly.pypd(0x2C8)
    qixhdz = Ly.py(rwdz, -0xF4) -- 骑小黑*+
    QIANS = Ly.py(rwdz, 0x1097c, 0x1094C) -- 强制牵手2*
    BFYY = Ly.py(rwdz, -0xDC) -- 友谊图标*+
    YYJG = Ly.pypd(0x14840, 0x12400) -- 友谊间隔*+
    haoysl = Ly.py(rwdz, -0x20B46C, -0x1FB0CC) -- 好友数量*+
    txhyjg = Ly.pypd(0x27C) -- 好友体型间隔*+
    haoymz = Ly.py(haoysl, 0x28) -- *
    ssygr = Ly.py(rwdz, 0x7164, 0x7144) -- 装扮*+
    nl = Ly.py(rwdz, 0x5260, 0x5250) -- 能量*+
    wxyq = Ly.py(nl, 0x24) -- 氧气*+
    zsdzs = Ly.py(rwdz, 0x344C, 0x3450) -- 姿势地址*+
    dxbaddr = Ly.py(rwdz, -0x2FD4, -0x2FC4) -- 身高*+
    mfdz = Ly.py(rwdz, 0x113B4, 0x11384) -- 魔法*+
    mfjgs = Ly.pypd(0x30B8, 0xCB4) -- 魔法间隔*+
    mfjg = Ly.pypd(28) -- 魔法间隔2*+
    dianxh = Ly.py(rwdz, -0x26E4B4, -0x23BD14) -- 点小黑*+
    zhayids = Ly.py(rwdz, 0x531C, 0x530C) -- 炸翼*+
    wyds = Ly.py(zhayids, -0x6C) -- 无翼*+
    yanhuadz = Ly.py(rwdz, 0x88B8, 0x8888) -- 烟花*+
    lazushuliang = Ly.py(rwdz, 0x9AC4, 0x9A94) -- 蜡烛数量*+
    dengjiaddr = Ly.py(rwdz, -0x25BE4, -0x22934) -- 等级*+
    mofsd = Ly.py(rwdz, 0x122A63C, 0x11A51AC) -- 魔法商店*+
    ydxzs1 = Ly.py(rwdz, -0x6E45C, -0x683CC) -- 原地先祖1*+
    ydxzs2 = Ly.py(ydxzs1, 0x3000) -- 原地先祖2*+
    dzsjs = Ly.py(ydxzs1, 0x28) -- 动作升级*+
    km_dz = Ly.py(rwdz, -0x56E14, -0x4EDA4) -- 开七门*+
end

Ly.pyi()

-- 配置文件
local WENJMC = {"YDPTSL", -- 原地跑图
"ZDYS", -- 自定义菜单
"YULURKS", -- 语录模块
"ZSOiKKKt", -- 带人模块
"MFKZCD", -- 魔法模块
"YJRCPZ" -- 一键日常
}

-- 删除配置
PZSC = function()
    local WENJ, CD = file.sonfile(Cun), {}
    for i = 1, #WENJ do
        CD[#CD + 1] = file.path(WENJ[i], 0)
    end
    local BMD = Ly.mcd(CD, nil, "选择需要保留的文件\n未勾选的文件确定后将删除")
    if BMD then
        for i = 1, #WENJ do
            if BMD[i] ~= true then
                os.remove(WENJ[i])
            end
        end
        Ly.tt("删除完成")
    end
end

-- 体型修改
TXXGS = function()
    if not TXBC then
        TXBC = Ly.getv(dxbaddr + 4, 16)
    end
    local TXCD = Ly.cd({"修改体型", "恢复体型"})
    if TXCD then
        if TXCD == 1 then
            local SGTX = gg.prompt({"调整体型值"}, {Ly.getv(Ly.jz(Ly.jz(TXXG + 8)), 16)}, {"number"})
            if SGTX then
                Ly.setv(Ly.jz(Ly.jz(TXXG + 8)), 16, SGTX[1])
                Ly.tt("修改完成")
            end
        else
            Ly.setv(Ly.jz(Ly.jz(TXXG + 8)), 16, TXBC)
            Ly.tt("体型已恢复")
        end
    end
end

-- 防止转白
FZB = function()
    Ly.KGR(KG[33], yd_pd + 0x13C, 4, 7, true)
end

FZB()

-- 太空漫步
ZHONLS = function()
    Ly.KGR(KG[34], ZHONL, 16, 0.1, true)
end

-- 跳跃强化
TYQHS = function()
    Ly.KGR(KG[38], TYQH, 16, 10)
end

-- 飞行强化
FXQHS = function()
    Ly.KGR(KG[37], FXQH, 16, 10)
end

-- 睡眠状态
SMZTS = function()
    Ly.KGR(KG[36], SMZT, 4, 65793, true)
end

-- 环境色调
HJSDS = function()
    local SC = gg.prompt({"曝光度", "光效"}, {Ly.getv(HJSD, 16), Ly.getv(HJSD + 4, 16)})
    if SC then
        Ly.setv(HJSD, 16, SC[1])
        Ly.setv(HJSD + 4, 16, SC[2])
        Ly.tt("修改完成")
    end
end

-- 姿势（站：0，一级坐：2，二级坐：1，躺：3）
zuozi = function(x)
    Ly.setv(zsdzs, 4, x)
end

-- 场景变速
jiasu = function(x)
    if GJF ~= 1 then
        jiasuaddr = Ly.jz(Ly.jz(sddz))
    end
    local JS = os.time()
    while Ly.getv(jiasuaddr, 16) ~= x do
        if os.time() - JS > 2 then
            break
        end
        Ly.setv(jiasuaddr, 16, x)
    end
end

-- 画质修改（分辨率）
HZXG = function()
    local VE = {{2400, 1080}, {4800, 2160}}
    local HZ = Ly.cd({"高清画质", "蓝光画质", "恢复画质"})
    if HZ then
        if HZ == 3 then
            Ly.setv(FBLS, 16, 0, false)
            Ly.setv(FBLS + 4, 16, 0, false)
        else
            Ly.setv(FBLS, 16, VE[HZ][1], true)
            Ly.setv(FBLS + 4, 16, VE[HZ][2], true)
        end
        Ly.tt("切换一次画质后生效")
    end
end

-- 变速菜单
biansu = function()
    suduk = {1, 0.1, 8}
    jiasr = Ly.cd({"初始速度", "0.1倍速度", "8倍速度", "10倍速(临时)", "自定速度"})
    if jiasr then
        if jiasr == 4 then
            jiasur()
            return
        end
        if jiasr == 5 then
            local SU = gg.prompt({"输入速度"}, {""}, {"number"})
            if SU then
                local AS = tonumber(SU[1])
                if AS == nil then
                    return Ly.tt("你输入了个甚莫东西？")
                end
                jiasu(AS)
            end
            return
        end
        jiasu(suduk[jiasr])
    end
end

-- 加速开关
jiasur = function()
    gg.setVisible(false)
    Ly.tt("点击悬浮窗停止加速")
    jiasu(10)
    while true do
        if gg.isVisible() then
            break
        end
    end
    jiasu(1)
end

-- 能量
wxnl = function()
    Ly.KGR(KG[1], nl, 16, 14, true)
end
-- 白耳机
bej = function()
    Ly.KGR(KG[2], Q_head, 4, 505712640)
end

-- 友谊树
youyis = function()
    if A(11) == "关" then
        qwp()
    end
    Ly.KGR(KG[3], youyi, 4, 1384120320)
end

-- 点火烧花
dianhuo = function()
    Ly.KGR(KG[4], dhzh, 4, 1384120352, true)
    Ly.KGS(KG[43], 1, 512, SHPY, 4, "8", 0, true)
end

-- 动作升级
dzsj = function()
    if A(11) == "关" then
        qwp()
    end
    Ly.KGS(KG[5], 1, #XZID, dzsjs, 4, 0x30, 6, true)
end

-- 无视地形
wusdx = function()
    Ly.KGR(KG[6], dundz, 4, 506982400)
end

-- 气泡窥屏
KPT = function()
    Ly.KGR(KG[47], new_lookaddr, 4, 1, true)
    Ly.KGS(KG[48], 1, 32, new_lookaddr + KPJG1, 4, KPJG2, 1, true)
end

-- 人物隐身
yins = function()
    Ly.KGR(KG[8], rwys, 4, 256, true)
end

-- 氧气
yangqi = function()
    Ly.KGR(KG[9], wxyq, 16, 1, true)
end

-- 无翼
wuyi = function()
    Ly.KGR(KG[10], wyds, 4, 0)
end

-- 全物品
qwp = function()
    Ly.KGR(KG[11], quanwup, 1, 82)
end

-- 无限烟花
wxyh = function()
    Ly.KGR(KG[12], yanhuadz, 4, 5, true)
end

-- 人物倒立
rwdl = function()
    Ly.KGR(KG[13], daoli, 16, 0, true)
    Ly.KGR(KG[50], daoli + 0x10, 16, -2, true)
    Ly.KGR(KG[49], daoli + 0xAC, 4, 3, true)
end

-- 留影蜡烛
lylz = function()
    Ly.KGR(KG[14], luzhikg, 4, 1)
end

-- 无视风墙
wusfq = function()
    Ly.KGS(KG[15], 1, 80, fengq - 0x1C, 16, "0x100", 0, true)
end

-- 吸花吸火
xihuo = function()
    Ly.KGR(KG[16], xilazr, 16, 999999999)
end

-- 防止举报
FJB = function()
    Ly.KGR(KG[17], nl, 16, -1, true)
end

-- 强制发言
LT = 0
LTK = function()
    Ly.KGS(KG[18], 1, 16, fayan + 0x184, 4, "0x304", 0, true)
    Ly.KGS(KG[46], 1, 16, fayan + 0x188, 4, "0x304", 0, true)
    Ly.KGS(KG[45], 1, 16, fayan + 0x184 + 180, 4, "0x304", 0, true)
    Ly.KGS(KG[44], 1, 16, fayan + 0x188 + 180, 4, "0x304", 0, true)
    if LT == 0 then
        Ly.at("开启后所有人可看到你的发言")
        LT = 1
    end
end

-- 发言模块
FYMK = function(X)
    local A = {}
    for i = 1, 374 do
        Ly.setr(A, fayan + 7 + i, 1, string.byte(X, i, i) or 0)
    end
    Ly.setr(A, fayan, 4, 0)
    Ly.setr(A, fayan + 4, 4, 0)
    Ly.set(A)
    Ly.setv(fayan, 4, 1)
end

-- 卡后台
KHT = function()
    Ly.at("如需退出请在游戏内发送：退出卡后台")
    while true do
        if HQWB() == "退出卡后台" then
            Ly.tt("已退出")
            break
        end
        if gg.isVisible() then
            gg.setVisible(false)
            if GJF ~= 1 then
                jiasuaddr = Ly.jz(Ly.jz(sddz))
            end
            Ly.KGR(KG[20], jiasuaddr, 16, 0.00001, nil, 1)
        end
    end
end

-- 开关门
KGMS = function(X)
    for i = 1, 8 do
        Ly.setv(MENS - (i - 1) * 0x1A0, 4, X)
    end
end

-- 炸翼功能
zhayis = function()
    local zha = gg.prompt({"输入炸翼数量:[0;" .. Ly.getv(dengjiaddr, 4) .. "]", "炸翼间隔(1000毫秒=1秒)",
                           "启用无限炸翼(启用本项则无视数量炸翼)"}, {1, 1000, false},
        {"number", "number", "checkbox"})
    if zha then
        if zha[3] == true then
            Ly.tt("点击悬浮窗结束炸翼")
            gg.setVisible(false)
            while true do
                if gg.isVisible() then
                    break
                end
                Ly.setv(zhayids, 4, 1)
                Ly.setv(dengjiaddr, 4, 200)
                Ly.sp(zha[2])
            end
        else
            for i = 1, zha[1] do
                Ly.setv(zhayids, 4, 1)
                Ly.sp(zha[2])
            end
        end
    end
end

-- 货币修改
XGHB = function()
    local tma, tmb, tmc = {}, {}, {}
    for i = 1, #HUOB do
        tma[#tma + 1] = HUOB[i][1]
        tmb[#tmb + 1] = Ly.getv(lazushuliang + HUOB[i][2], 4)
        tmc[#tmc + 1] = "number"
    end
    local XG = gg.prompt(tma, tmb, tmc)
    if XG then
        for i = 1, #HUOB do
            Ly.setv(lazushuliang + HUOB[i][2], 4, XG[i])
        end
    end
end

-- 计时
local HUOBIK = {}
local JISQ, jishi1, ZHSJU = 0, 0, 0
jsy = function()
    local LZTJ = ""
    if JISQ == 0 then
        jishi1 = os.time()
        for i = 1, #HUOB do
            HUOBIK[i] = Ly.getv(lazushuliang + HUOB[i][2], 4)
        end
        JISQ = 1
    else
        JISQ = 0
        local BLCN, JLCN = 0, 0
        if ZHSJU > 0 then
            LZTJ = "\n共获取烛火数据：" .. ZHSJU .. "点"
        end
        for i = 1, #HUOB do
            local AR = Ly.getv(lazushuliang + HUOB[i][2], 4)
            local JISUAN = AR - HUOBIK[i]
            if JISUAN > 0 then
                local JSCN = ""
                if i == 2 then
                    BLCN = JISUAN
                    JSCN = "（约" .. string.format("%.3f", string.format("%.3f", JISUAN) / 120.000) .. "根）"
                end
                if i == 6 then
                    JLCN = string.format("%.3f", JISUAN)
                end
                LZTJ = LZTJ .. "\n" .. HUOB[i][1] .. "增加了：" .. JISUAN .. HUOB[i][3] .. JSCN
            end
        end
        if BLCN > 0 then
            LZTJ = LZTJ .. "\n有效烛火占比为：" ..
                       string.format("%.2f", ((string.format("%.3f", BLCN) + JLCN) / ZHSJU) * 100) .. "%"
        end
        time = os.time() - jishi1
        Ly.at("\n本次执行耗时：" ..
                  string.format("%.d分%.d秒", math.fmod(math.floor(time / 60), 60), math.fmod(time, 60)) .. LZTJ)
    end
end

-- 光翼修改
gyxg = function()
    local gy = gg.prompt({"设置需要修改的光翼数量:[0;300]"}, {Ly.getv(dengjiaddr, 4)}, {"number"})
    if gy then
        Ly.setv(dengjiaddr, 4, gy[1])
    end
end

-- 坐标模块
zbiao = function(dzr, xzy)
    tmp = {}
    for i = 1, 3 do
        Ly.setr(tmp, dzr + (i - 1) * 4, 16, xzy[i])
    end
    Ly.set(tmp)
end

-- 瞬移坐标
sy = function(xyz)
    if type(xyz) ~= "table" then
        xyz = ZBK(xyz)
    end
    if xyz == 0 then
        return Ly.tt("坐标格式不正确")
    end
    zbiao(rwdz + 4, xyz)
end

-- 自身坐标
ZBS = function()
    local zbr = {}
    for i = 1, 3 do
        zbr[i] = Ly.getv(rwdz + i * 4, 16)
    end
    return zbr
end

-- 吸取物品（起始数，结尾数，地址，间隔）
xiqu = function(a, b, c, d)
    zbr = ZBS()
    for i = a, b do
        zbiao(c + (i - 1) * d, zbr)
    end
end

XIGB = function()
    xiqu()
end

-- 位置判断
wzpd = function()
    for i = 1, #map do
        if Ly.getv(kydpds, 4) == map[i][2] then
            X = i
            return i
        end
    end
end

-- 尾迹画心
KZHX = function()
    local XZ = gg.prompt({"飞行高度[1;50]", "爱心半径[1;15]", "圈数[1;50]"}, {10, 5, 3},
        {'number', 'number', 'number'})
    if XZ then
        local xzy = ZBS()
        local z = tostring(xzy[2]) + XZ[1]
        for i = 1, 100 * XZ[3] do
            local x = tostring(xzy[1]) + XZ[2] * 0.07 *
                          (16 * math.sin(i * 3.14 / 50) * math.sin(i * 3.14 / 50) * math.sin(i * 3.14 / 50))
            local y = tostring(xzy[3]) + XZ[2] * 0.07 *
                          (13 * math.cos(i * 3.14 / 50) - 5 * math.cos(2 * i * 3.14 / 50) - 2 *
                              math.cos(3 * i * 3.14 / 50) - math.cos(4 * i * 3.14 / 50))
            sy({x, z, y})
            Ly.sp(20)
        end
    end
end

-- 任意门
colortmp = {"UILogo"}
rym = function(csr)
    if #colortmp ~= 0 then
        a = tonumber(math.random(1, #colortmp))
        map_color = colortmp[a]
    else
        map_color = "0"
    end
    local door, doorx = Any_daddr, {map[csr][1]:byte(0, -1)}
    local color = {(string.char(#map_color * 2) .. map_color):byte(0, -1)}
    local tem, temb = {}, {}
    Ly.setr(tem, door - 0x14, 16, 80000)
    Ly.setr(tem, door - 0x28, 16, 80000)
    Ly.setr(tem, door - 0x3C, 16, 80000)
    Ly.setr(temb, door + 0x60, 4, 1)
    Ly.setr(temb, door + 0x2C, 32, 49)
    Ly.setr(temb, door + 0x2C + 8, 32, 24)
    Ly.setr(temb, door + 0x2C + 16, 32, door + 0x39B8)
    Ly.setr(temb, door + 0x3A14, 4, 1)
    for j = 1, 16 do
        Ly.setr(temb, door + 0x34 + 24 + j - 1, 1, color[j] or 0)
    end
    for j = 1, 24 do
        Ly.setr(temb, door + 0x39B8 + j - 1, 1, doorx[j] or 0)
    end
    Ly.set(temb)
    Ly.set(tem)
    weizhi = os.time()
    while true do
        wzpd()
        if X == csr then
            break
        end
        if os.time() - weizhi > 5 then
            Ly.tt("传送超时")
            break
        end
    end
end

-- 原地切图
TP = function(ID)
    if io.open(Cun .. "YUANDIQIETMS") then
        local QIE = 0
        for i = 1, #map do
            if map[i][2] == ID then
                QIE = map[i][4]
            end
        end
        rym(QIE)
        while Ly.getv(rwdz - pykr[#pykr], 4) ~= ID do
            Ly.sp(100)
        end
        Ly.sp(2000)
    else
        rym(49)
        while Ly.getv(rwdz - pykr[#pykr], 4) ~= ID do
            local GR = {}
            for k = 1, #pykr - 1 do
                Ly.setr(GR, rwdz - pykr[k], 4, ID)
            end
            Ly.set(GR)
        end
    end
end

-- 传送菜单
rycs = function()
    local menu = {"遇境", "晨岛", "云野", "雨林", "霞谷", "暮土", "禁阁", "暴风眼"}
    rycsr = Ly.cd(menu, nil, "任意传送")
    if rycsr then
        dt = DITUCD
        tmp = {}
        for i = 1, #dt[rycsr] do
            tmp[#tmp + 1] = {}
            tmp[#tmp] = map[dt[rycsr][i]][3]
        end
        chuans = Ly.cd(tmp)
        if chuans then
            qt(dt[rycsr][chuans])
        end
    end
end

-- 传送判断
qt = function(r)
    wzpd()
    if X ~= r then
        rym(r)
    end
end

-- 魔法修改模块
MFKTK = function(wb)
    local tmp = {}
    for i = 1, 24 do
        Ly.setr(tmp, km_dz + (i - 1), 1, string.byte(wb, i, i) or 0)
        Ly.setr(tmp, km_dz + 24 + (i - 1), 1, string.byte(wb, i, i) or 0)
    end
    Ly.set(tmp)
    magic(539651423)
end

-- 开七门
KQM = function()
    MFKTK("AllPortals")
    qt(49)
    Ly.sp(1000)
    qt(1)
    Ly.sp(200)
    qt(43)
    Ly.sp(1500)
    sy({10.77337646484375, 327.4480895996094, 14.187789916992188})
    Ly.sp(4000)
    zuozi(2)
    Ly.sp(200)
    sy({1.3173106908798218, 0.3985660672187805, 4.883327484130859})
    while wzpd() ~= 43 do
        Ly.sp(500)
    end
    sy({10.77337646484375, 327.4480895996094, 14.187789916992188})
    jiasur()
    Ly.tt("开图完成")
end
QZKM = function()
    KGMS(1)
    Ly.tt("开图完成")
end

-- 发包提交

Ly.fb = function(A, B)
    tmp = {}
    Ly.setr(tmp, A + 0xC, 4, 2)
    Ly.setr(tmp, fbcw + 8, 32, A)
    Ly.setr(tmp, fbcw, 4, 1)
    Ly.set(tmp)
    tmp = {}
    Ly.setr(tmp, fbcw + 4, 4, 0)
    Ly.set(tmp)
    local back = os.clock()
    while (Ly.getv(fbcw + 4, 4) == 0) do
        if os.clock() - back > (B or 1) then
            Ly.setv(A + 0xC, 4, 0)
            break
        end
    end
    Ly.setv(A + 0xC, 4, 0)
end

-- 文本发包
Ly.wbfb = function(a, b, c, d)
    local tmp = {}
    for i = 1, #a do
        for u = 1, 24 do
            Ly.setr(tmp, b + c + (u - 1), 1, a[i]:byte(u, u) or 0)
        end
        Ly.set(tmp)
        Ly.fb(b, d)
    end
end

-- 数值发包
Ly.szfb = function(a, b, c, d)
    local tmp = {}
    for i = 1, #a do
        Ly.setr(tmp, b + c + (i - 1) * 4, 4, a[i])
    end
    Ly.set(tmp)
    Ly.fb(b, d)
end

-- 星盘好友名称
haoyoumc = function()
    Ly.fb(haoysl - Jo)
    local tmp = {}
    for j = 1, Ly.getv(haoysl, 4) do
        tmp[#tmp + 1] = WBEN(haoysl + 0x28 + 1 + py * (j - 1))
    end
    return tmp
end

-- 星盘好友id
haoyouid = function()
    local tmp = {}
    for j = 1, Ly.getv(haoysl, 4) do
        tmp[#tmp + 1] = {}
        for i = 1, 4 do
            tmp[#tmp][i] = Ly.getv(haoysl + 8 + i * 4 - 4 + py * (j - 1), 4)
        end
    end
    return tmp
end

-- 状态重置
DBCZ = function()
    local PY = {shouxinh, shouax, huoqurw, jieshourw, xiugairw, tijiaorw, HQMF, zdxz, fbdz, sxdz}
    for i = 1, #PY do
        if Ly.getv(PY[i] + 0xC, 4) ~= 0 then
            Ly.setv(PY[i] + 0xC, 4, 0)
        end
    end
    Ly.setv(fbcw + 0x8, 32, 0)
end

-- 免费魔法兑换
MFMFDH = function()
    Ly.fb(MFYZ)
    Ly.setv(HQMF + Jg + 0x10, 4, Ly.getv(MFYZ + Jo, 4))
    for i = 1, #MFDHSZ do
        if MFDHSZ[i][3] == 0 then
            Ly.szfb(MFDHSZ[i], HQMF, Jg, 0.5)
        end
    end
    Ly.tt("每日魔法领取完成")
end

-- 解锁先祖
JSXZ = function(ID, PD)
    local JC, ADS = 0, {}
    while true do
        if JC == 200 then
            ADS = nil
            break
        end
        if Ly.getv(KXZID + (JC * 0x140), 32) == ID then
            ADS[#ADS + 1] = Ly.jz(KXZID + (JC * 0x140) + 8)
            ADS[#ADS + 1] = ID
            ADS[#ADS + 1] = Ly.getv(KXZID + (JC * 0x140), 4)
            break
        end
        JC = JC + 1
    end
    if PD then
        local tmp = {}
        for y = 1, 8 do
            tmp[#tmp + 1] = Ly.getv(ADS[1] + (y - 1) * 4, 4)
        end
        tmp[#tmp + 1] = ID
        Ly.szfb(tmp, zdxz, Jr)
    end
    return ADS
end

-- 先祖兑换
Ly.JDS = function(ID, MC)
    local ADS = JSXZ(ID)
    local tmk, cdk = {}, {}
    if ADS then
        for k = 1, 30 do
            if Ly.getv(ADS[1] + ((k - 1) * 0x68) + 0x38, 4) == ADS[3] then
                tmk[#tmk + 1] = {}
                for r = 1, 8 do
                    tmk[#tmk][r] = Ly.getv(ADS[1] + ((k - 1) * 0x68) + (r - 1) * 4, 4)
                end
                tmk[#tmk][9] = ADS[3]
            end
        end
        cdk[#cdk + 1] = "兑换全部"
        for i = 1, #tmk do
            cdk[#cdk + 1] = "先祖节点" .. i
        end
        local CDR = Ly.mcd(cdk, nil, "当前先祖：" .. MC .. "\n共获取到：" .. #tmk ..
            " 个节点\n选择节点进行兑换（禁止跳节点兑换，否则掉线）")
        if CDR then
            for i = 1, #tmk do
                if CDR[1] == true then
                    CDR[i + 1] = true
                end
                if CDR[i + 1] == true then
                    Ly.szfb(tmk[i], zdxz, Jr)
                end
            end
            Ly.tt("兑换完成")
        end
    else
        Ly.tt("未获取" .. MC .. "到节点信息")
    end
end
JESK = function()
    local CD1 = {}
    for i = 1, #XZCD do
        CD1[#CD1 + 1] = XZCD[i][1]
    end
    local CDA = Ly.cd(CD1)
    if CDA then
        local CD2, CD3 = {}, {}
        for i = 2, #XZCD[CDA] do
            CD3[#CD3 + 1] = XZCD[CDA][i][1]
            CD2[#CD2 + 1] = XZCD[CDA][i][2]
        end
        local CDB = Ly.cd(CD2, nil, "选择一个先祖\n仅支持兑换现有先祖，否则掉线")
        if CDB then
            Ly.JDS(CD3[CDB], CD2[CDB])
        end
    end
end

-- 一键季节先祖
Ly.JJXZ = function(SHUL)
    for i = (SHUL or 1), #Jijiexz do
        local ADS = JSXZ(Jijiexz[i], true)
        if ADS then
            local tmk = {}
            for k = 1, 30 do
                if Ly.getv(ADS[1] + (k * 0x68) + 0x38, 32) == ADS[2] then
                    tmk[#tmk + 1] = {}
                    for r = 1, 8 do
                        tmk[#tmk][r] = Ly.getv(ADS[1] + (k * 0x68) + (r - 1) * 4, 4)
                    end
                    tmk[#tmk][9] = Jijiexz[i]
                end
            end
            for h = 1, #tmk do
                Ly.szfb(tmk[h], zdxz, Jr)
            end
        end
    end
    Ly.at("季节主线已完成")
end
KJJ = function()
    local XZCD = Ly.cd({"当前季节向导", "所有季节向导"})
    if XZCD then
        if XZCD == 1 then
            Ly.JJXZ(#Jijiexz)
        else
            Ly.JJXZ()
        end
    end
end

-- 解锁常驻先祖
Ly.CZXZ = function(SL)
    for i = (SL or 1), #Ydxz do
        JSXZ(Ydxz[i], true)
    end
    Ly.at("星盘先祖已完成")
end
KCZ = function()
    local XZCD = Ly.cd({"当前季节先祖", "所有星盘先祖"})
    if XZCD then
        if XZCD == 1 then
            Ly.CZXZ(#Ydxz - 4)
        else
            Ly.CZXZ()
        end
    end
end

-- 一键复刻
QUZNFK = function()
    Ly.tt("正在开启动作")
    local tmp = {}
    for i = 1, #DONZ do
        tmp[#tmp + 1] = "" .. DONZ[i]
    end
    Ly.wbfb(tmp, XZDZ, Jg)
    local XZ = Ly.at("开启完成，是否切图刷新", "切图刷新", "返回")
    if XZ == 1 then
        jiasu(10)
        qt(3)
        Ly.tt(2000)
        qt(1)
        jiasu(1)
    end
end

-- 一键神龛
YJSK = function()
    local tmp = {}
    for i = 1, #STRC do
        tmp[#tmp + 1] = "" .. STRC[i] .. "_found"
    end
    Ly.wbfb(tmp, YDSK, Jg)
    Ly.tt("神龛开启完成")
end

-- 修改发言举报
SESE = function()
    local JUBDZ = rwdz - 0x219CAC -- 0x98内容0x78id0x60举报原因
    local tmp = {}
    for i = 1, 24 do
        Ly.setr(tmp, JUBDZ + 0x98 + i - 1, 1, string.byte("我要色色", i, i) or 0)
    end
    for i = 1, 24 do
        Ly.setr(tmp, JUBDZ + 0x60 + i - 1, 1, string.byte("开挂色情违法", i, i) or 0)
    end
    Ly.set(tmp)
    Ly.fb(JUBDZ)
    Ly.tt("禁言成功")
end

-- 一键收火
shouh = function()
    local id, SJ = 0, {}
    while Ly.getv(xinhid + (id * 0x60), 4) ~= 0 do
        SJ[#SJ + 1] = {}
        for i = 1, 4 do
            SJ[#SJ][i] = Ly.getv(xinhid + 0x24 + (i - 1) * 4 + (id * 0x60), 4)
        end
        SJ[#SJ][5] = Ly.getv(xinhid + (id * 0x60), 4)
        SJ[#SJ][6] = Ly.getv(xinhid + (id * 0x60) + 4, 4)
        id = id + 1
    end
    if #SJ > 0 then
        for i = 1, #SJ do
            Ly.szfb(SJ[i], shouxinh, Jg, 0.5)
        end
    end
end

-- 一键收心
SHOUIX = function()
    local id, SJ = 0, {}
    while Ly.getv(AXID + (id * 0x60), 4) ~= 0 do
        SJ[#SJ + 1] = {}
        for i = 1, 3 do
            SJ[#SJ][i] = Ly.getv(AXID + (id * 0x60) + (i - 1) * 4, 4)
        end
        id = id + 1
    end
    if #SJ > 0 then
        for i = 1, #SJ do
            Ly.szfb(SJ[i], shouax, Jg)
        end
    end
end

-- 星盘封装
Ly.xpfz = function(DIZ, IDR, IDK)
    local tmp = {}
    for k = 1, 4 do
        tmp[#tmp + 1] = IDR[k]
    end
    tmp[#tmp + 1] = IDK
    Ly.szfb(tmp, DIZ, Jg)
end

-- 单好友模块
HYSSMK = function(MZ, ID, PX)
    local CD = {"身高", "送火", "送心", "拉黑"}
    local CAID = Ly.cd(CD, nil, "当前选择好友：" .. MZ)
    if CAID then
        if CAID == 1 then
            SGCX(haoysl + 0x28 + py * (PX - 1) + txhyjg)
        end
        if CAID == 2 then
            Ly.xpfz(fbdz, ID, 6)
            return Ly.tt("赠送心火完成")
        end
        if CAID == 3 then
            Ly.xpfz(sxdz, ID, 2)
            return Ly.tt("赠送爱心完成")
        end
        if CAID == 4 then
            Ly.xpfz(laheihy, ID, 1)
            Ly.fb(haoysl - Jo)
            return Ly.tt("已拉黑：" .. MZ)
        end
    end
end

-- 一键拉黑
lahei = function()
    local MZ, ID = haoyoumc(), haoyouid()
    MZ[#MZ + 1] = "全部拉黑"
    local XZ = Ly.mcd(MZ, nil, "共" .. #MZ .. "位好友\n选择需要拉黑的好友(全部拉黑在最下面)")
    if XZ then
        for i = 1, #MZ - 1 do
            if XZ[#MZ] == true then
                XZ[i] = true
            end
            if XZ[i] == true then
                Ly.xpfz(laheihy, ID[i], 1)
                Ly.tt(MZ[i] .. "已完成拉黑")
            end
        end
        Ly.fb(haoysl - Jo)
    end
end
-- 一键送心
sonxin = function()
    local SZJL, MZ, ID = CJPZ("SZPZsr", "w+", ""), haoyoumc(), haoyouid()
    local XZBC = WJPZ("SZPZsr")
    if #XZBC == (0 or nil) then
        Ly.tt("请前往 一键送心配置 设置需要送心的好友")
        return
    end
    for i = 1, #XZBC do
        for v = 1, #MZ do
            if XZBC[i] == MZ[v] then
                Ly.xpfz(sxdz, ID[v], 2)
                Ly.tt(MZ[v] .. "赠送完成")
            end
        end
    end
end
SONXPZ = function()
    local SZJL, MZ = CJPZ("SZPZsr", "w+", ""), haoyoumc()
    local XZBC, KGE = WJPZ("SZPZsr"), {}
    for i = 1, #MZ do
        KGE[i] = false
    end
    for i = 1, #XZBC do
        for v = 1, #MZ do
            if XZBC[i] == MZ[v] then
                KGE[v] = true
            end
        end
    end
    local PZCD = Ly.mcd(MZ, KGE, "选择需要送心的好友\n选择后会按照备注送心")
    if PZCD then
        io.open(Cun .. "SZPZsr", "w+"):write("")
        for i = 1, #MZ do
            if PZCD[i] == true then
                io.open(Cun .. "SZPZsr", "a+"):write("'" .. MZ[i] .. "',")
            end
        end
        Ly.tt("配置已保存")
    end
end

-- 一键送火
sonhuo = function()
    local MZ, ID = haoyoumc(), haoyouid()
    for i = 1, #MZ do
        Ly.xpfz(fbdz, ID[i], 6)
        Ly.tt(MZ[i] .. "赠送完成")
    end
end

-- 原地跑道
ydpd = function()
    Ly.wbfb(xiagupd, yd_pd, Jg)
    Ly.tt("完成")
end

-- 先祖白蜡
XZBLZ = function()
    if GJF == 1 then
        local tmp = {}
        for i = 1, #XZLZR do
            for v = 2, #XZLZR[i] do
                tmp[#tmp + 1] = XZLZR[i][v]
            end
        end
        Ly.wbfb(tmp, yd_pd, Jg)
    else
        for i = 1, #XZLZR do
            local tmp = {}
            for v = 2, #XZLZR[i] do
                tmp[#tmp + 1] = XZLZR[i][v]
            end
            TP(XZLZR[i][1])
            Ly.wbfb(tmp, yd_pd, Jg)
        end
    end
    jiasu(1)
    Ly.tt("完成")
end

-- 红石任务
hsrw = function()
    for i = 1, #HSid do
        local tmp = {}
        for u = 1, 48 do
            Ly.setr(tmp, kydpds + 4 + (u - 1), 1, HSid[i]:byte(u, u) or 0)
        end
        Ly.set(tmp)
        Ly.setv(yd_pd + Jg, 4, 49)
        Ly.setv(yd_pd + Jg + 0x8, 4, #HSid[i])
        Ly.setv(yd_pd + Jg + 0x10, 32, kydpds + 0x4)
        Ly.setv(yd_pd + Jg + 0x18, 16, 1)
        Ly.fb(yd_pd)
    end
end

-- 获取任务数量
HQrws = function()
    local t = 0
    while true do
        if Ly.getv(ksydrw + (t * 8) + 8, 4) < Ly.getv(ksydrw + (t * 8), 4) then
            break
        end
        t = t + 1
    end
    rwsl = t + 1
    return rwsl
end

-- 每日任务
MRRW = function()
    HQrws()
    for i = 1, rwsl do
        Ly.setv(ksydrw + ((i - 1) * 8) + 4, 16, Ly.getv(ksydrw + ((i - 1) * 8) + 4, 16) + 60)
        Ly.setv(ksydrw + (rwsl * 8) + 4 * i, 4, i)
    end
    Ly.setv(ksydrw + (rwsl * 12) + 4, 4, rwsl)
    gg.toast("原地任务使用完成")
end

-- 任务修复
XFrw = function()
    HQrws()
    local tmp = {}
    for i = 1, rwsl do
        Ly.setr(tmp, ksydrw + 4 + (i - 1) * 8, 16, 0)
        Ly.setr(tmp, ksydrw + (rwsl * 8) + 4 * i, 4, i)
    end
    Ly.set(tmp)
    Ly.at("任务已修复，第二天即可正常完成任务")
end

-- 一键任务
yijianrw = function()
    Ly.fb(huoqurw)
    idk = {}
    for i = 1, 4 do
        idk[i] = Ly.getv(huoqurw + Jo + ((i - 1) * 4), 4)
    end
    if GJF == 1 then
        for i = 1, #idk do
            Ly.setv(jieshourw + Jg, 4, idk[i])
            Ly.fb(jieshourw)
        end
    else
        Ly.szfb(idk, jieshourw, Jg)
    end
    HQrws()
    tmp = {}
    for i = 1, rwsl do
        Ly.setr(tmp, xiugairw + Jg + 8 + ((i - 1) * 8), 4, i)
        Ly.setr(tmp, xiugairw + Jg + 8 + 4 + ((i - 1) * 8), 16, Ly.getv(ksydrw + ((i - 1) * 8) + 4, 16) + 60)
        Ly.setr(tmp, ksydrw + ((i - 1) * 8) + 4, 16, Ly.getv(ksydrw + ((i - 1) * 8) + 4, 16) + 60)
    end
    Ly.set(tmp)
    Ly.fb(xiugairw, 2)
    for i = 1, #idk do
        Ly.setv(tijiaorw + Jr, 4, idk[i])
        Ly.fb(tijiaorw, 2)
    end
end

-- 原地跑图
ydpt = function()
    local PZ = CJPZ(WENJMC[1], "a+", "【a】0【a】【b】15【b】【c】5【c】")
    local a, b, c = PZ:match("【a】(.-)【a】"), PZ:match("【b】(.-)【b】"), PZ:match("【c】(.-)【c】")
    if not YJRC then
        jsy()
    end
    if GJF == 1 then
        Ly.setv(kydpds + 4, 4, -114950142)
        Ly.setv(kydpds + (33 * 4), 4, 32)
    end
    jiasu(c)
    rym(49)
    Ly.sp(500)
    for i, v in ipairs(zjcandle) do
        if i == b + 1 then
            break
        end
        ZHSJU = ZHSJU + #v
        if GJF == 1 then
            Ly.setv(kydpds, 4, v[1])
        else
            Ly.sp(a * 1000)
            TP(v[1])
            Ly.setv(kydpds, 4, v[1])
        end
        for k = 0, (#v - 1) / 32 do
            Ly.tt("地图进度  :  " .. i .. " / " .. b .. "\n当前图烛光  :  " ..
                      ((k + 1) * 100 / ((#v - 1) / 32 + 1)) .. " % ")
            local GK = {}
            for j = 1, 32 do
                Ly.setr(GK, kydpds + j * 4, 4, v[j + (1 + k * 32)] or 0)
            end
            Ly.set(GK)
            GK = nil
            Ly.setv(kydpds + (33 * 4), 4, 32)
            while true do
                if Ly.getv(kydpds + (33 * 4), 4) == 0 then
                    break
                end
            end
        end
    end
    if io.open(Cun .. "SHENKANCSDIT") then
        local CSDT = math.random(40, 43)
        rym(CSDT)
        Ly.sp(2000)
    end
    rym(1)
    jiasu(1)
    if not YJRC then
        jsy()
    end
end

-- 原地跑配置
YDPPZ = function()
    local QTMS, SKDT, SBJL = false, false, false
    if io.open(Cun .. "YUANDIQIETMS") then
        QTMS = true
    end
    if io.open(Cun .. "SHENKANCSDIT") then
        SKDT = true
    end
    if io.open(Cun .. "DITUZHONSBJL") then
        SBJL = true
    end
    local PZ = CJPZ(WENJMC[1], "a+", "【a】0【a】【b】15【b】【c】5【c】")
    local a, b, c = PZ:match("【a】(.-)【a】"), PZ:match("【b】(.-)【b】"), PZ:match("【c】(.-)【c】")
    local GP = gg.prompt({"选择每图间隔(秒)[0;45]", "选择地图数量[1;" .. #zjcandle .. "]",
                          "选择跑图倍速[1;10]", "跑图结束后传送禁阁", "进图跑图模式",
                          "地图有双倍季蜡"}, {a, b, c, SKDT, QTMS, SBJL},
        {'number', 'number', 'number', 'checkbox', 'checkbox', 'checkbox'})
    if GP then
        if GP[4] == true then
            io.open(Cun .. "SHENKANCSDIT", "w+"):write("")
        else
            os.remove(Cun .. "SHENKANCSDIT")
        end
        if GP[5] == true then
            io.open(Cun .. "YUANDIQIETMS", "w+"):write("")
        else
            os.remove(Cun .. "YUANDIQIETMS")
        end
        if GP[6] == true then
            io.open(Cun .. "DITUZHONSBJL", "w+"):write("")
        else
            os.remove(Cun .. "DITUZHONSBJL")
        end
        Ly.xrwj(Cun .. WENJMC[1], "w+",
            "【a】" .. GP[1] .. "【a】【b】" .. GP[2] .. "【b】【c】" .. GP[3] .. "【c】")
        Ly.tt("配置已保存")
    end
end

-- 一键季蜡
JIJIELZ = function()
    local JLS, SL = 0, 1
    if io.open(Cun .. "DITUZHONSBJL") then
        SL = 2
    end
    local PZ = CJPZ(WENJMC[1], "a+", "【a】0【a】【b】15【b】【c】5【c】")
    local a, c = PZ:match("【a】(.-)【a】"), PZ:match("【c】(.-)【c】")
    jiasu(c)
    rym(49)
    Ly.sp(500)
    local GK = {}
    for i, v in ipairs(JJLZ) do
        if JLS == SL then
            Ly.tt("地图季蜡获取完成")
            break
        end
        if GJF == 1 then
            Ly.setv(kydpds, 4, v[1])
        else
            Ly.sp(a * 1000)
            TP(v[1])
            Ly.setv(kydpds, 4, v[1])
        end
        local CNPD = Ly.getv(lazushuliang + HUOB[6][2], 4)
        for k = 0, (#v - 1) / 32 do
            Ly.tt("地图进度  :  " .. i .. " / " .. #JJLZ .. "\n当前图烛光  :  " ..
                      ((k + 1) * 100 / ((#v - 1) / 32 + 1)) .. " % ")
            for j = 1, 32 do
                Ly.setr(GK, kydpds + j * 4, 4, v[j + (1 + k * 32)] or 0)
            end
            Ly.set(GK)
            Ly.setv(kydpds + (33 * 4), 4, 32)
            while true do
                if Ly.getv(kydpds + (33 * 4), 4) == 0 then
                    break
                end
            end
        end
        if Ly.getv(lazushuliang + HUOB[6][2], 4) > CNPD then
            CNPD = Ly.getv(lazushuliang + HUOB[6][2], 4)
            JLS = JLS + 1
        end
    end
    if io.open(Cun .. "SHENKANCSDIT") then
        local CSDT = math.random(40, 43)
        rym(CSDT)
        Ly.sp(2000)
    end
    rym(1)
    jiasu(1)
    Ly.tt("跑图结束")
end

-- 原地光翼
ydgy = function()
    local by
    local SP = gg.prompt({"光翼获取间隔（秒）[0;60]", "光翼每次获取数量[1;10]",
                          "跳过已有光翼（易封号）", "拿永久翼（仅支持国际服）"},
        {15, 1, false, false}, {"number", "number", 'checkbox', 'checkbox'})
    if SP then
        local CIS, JIC = SP[2], 0
        for t = 1, 2 do
            if SP[4] ~= true then
                if t == 2 then
                    break
                end
            end
            if t == 2 then
                by = "先祖"
            else
                by = "地图"
            end
            for i = 1, #GYSK[t] do
                local PD1 = Ly.getv(dengjiaddr, 4)
                Ly.wbfb({GYSK[t][i]}, YD_GY, Jg)
                JIC = JIC + 1
                if JIC == CIS then
                    JIC = 0
                    if i ~= #GYSK[t] then
                        local S = math.random(0, 5)
                        if (Ly.getv(dengjiaddr, 4) > PD1) then
                            Ly.tt(by .. "光翼获取进度" .. i .. "/" .. #GYSK[t])
                            Ly.sp((SP[1] + S) * 1000)
                        else
                            if SP[3] ~= true then
                                Ly.tt("自身已拥有第" .. i .. "个光翼\n等待获取下一个")
                                Ly.sp((SP[1] + S) * 1000)
                            end
                        end
                    else
                        Ly.tt(by .. "光翼获取结束")
                    end
                end
            end
        end
    end
end

-- 原地献祭
xjmk = function()
    local tmp = {}
    for i = 0, 8 do
        tmp[#tmp + 1] = "l_Storm_" .. i
    end
    Ly.wbfb(tmp, YD_GY, Jg)
    Ly.wbfb(tmp, YD_XJ, Jg)
    Ly.fb(YD_HONGLAZHU)
end
ydxj = function()
    local XY = Ly.at("是否执行原地献祭？", "是", "否")
    if XY ~= 1 then
        return
    end
    if GJF == 1 then
        Ly.tt("开始国际服献祭，点击悬浮窗结束")
        local JC = 0
        gg.setVisible(false)
        while true do
            if gg.isVisible() then
                break
            end
            xjmk()
            JC = JC + 2.5
            Ly.tt("本次献祭获取蜡烛数量：" .. JC)
        end
    else
        for i = 1, 8 do
            xjmk()
        end
    end
end

-- 自慰衣柜
YGR = {}
zwhz = function()
    local tma, tmb, tmc, tmd = {}, {}, {}, {4, 8, 12, 16, 20, 28, 36}
    for i = 1, #fsid do
        tma[#tma + 1] = fsid[i][1]
    end
    tma[#tma + 1] = "恢复装扮"
    local suis1 = Ly.cd(tma)
    if suis1 == #tma then
        for v = 1, #fsid do
            if YGR[v] ~= nil then
                Ly.setv(ssygr + tmd[v], 4, YGR[v])
            end
        end
        YGR = {}
        Ly.tt("装扮已恢复")
        return
    end
    if suis1 then
        for t = 2, #fsid[suis1] do
            tmb[#tmb + 1] = fsid[suis1][t][1]
            tmc[#tmc + 1] = fsid[suis1][t][2]
        end
        local suis2 = Ly.cd(tmc)
        if suis2 then
            if not YGR[suis1] then
                YGR[suis1] = Ly.getv(ssygr + tmd[suis1], 4)
            end
            Ly.setv(ssygr + tmd[suis1], 4, tmb[suis2])
            Ly.tt(fsid[suis1][1] .. " 已更换为 " .. tmc[suis2])
        end
    end
end

-- 随身衣柜
ssyg = function()
    local tmp = {}
    for i = 1, #suishen do
        tmp[#tmp + 1] = suishen[i][1]
    end
    local YGCD = Ly.cd(tmp)
    if YGCD then
        Ly.setv(ssygk, 4, suishen[YGCD][2])
        Ly.setv(ssygk - 0x4, 4, 1)
        Ly.setv(ssygk - 0x3C, 4, 1, true)
        Ly.tt("点击悬浮窗取消衣柜")
        while true do
            if gg.isVisible() then
                Ly.setv(ssygk - 0x3C, 4, 1, false)
                break
            end
        end
    end
end

-- 无限纸船
WSFZS = function()
    Ly.setv(ssygr + 36, 4, 992885953)
    local XG = {}
    for i = 1, 32 do
        Ly.setr(XG, WXFZ - 0x3C + i, 1, string.byte("SocialMessageBoats", i, i) or 0)
    end
    Ly.set(XG)
    Ly.at("修改完成\n请站在水中点击板凳")
end

-- 魔法模块
magic = function(id, name)
    local mfsx = {0, -1600133292, 0, 1600132692, 0, -1720562886, -1806973714, 1020395176, 131004170, 1}
    Ly.setv(mfdz + mfjgs, 4, 6, true)
    for i = 1, 6 do
        if Ly.getv(mfdz + ((i - 1) * 48), 4) == 0 then
            mfcw = i
            break
        end
    end
    if not mfcw then
        mfcw = 1
    end
    local tmp = {}
    for i = 1, #mfsx do
        Ly.setr(tmp, mfdz + ((mfcw - 1) * 48) + (i * 4), 4, mfsx[i])
    end
    Ly.set(tmp)
    if not id then
        for i = 1, 6 do
            Ly.setv(mfdz + ((i - 1) * 48), 4, 0)
            Ly.setv(mfdz + ((i - 1) * 48) + mfjg, 4, 0, false)
        end
        Ly.setv(mfdz + ((mfcw - 1 - 1) * 48) + mfjg, 4, 0, false)
        Ly.setv(SYLD, 16, 0)
        mfcw = nil
        return Ly.tt("清除所有魔法效果")
    end
    if id == "魔法强化" then
        Ly.setv(mfdz + ((mfcw - 1 - 1) * 48) + mfjg, 4, 0, true)
        return Ly.tt(id)
    end
    if id == "光之精灵" then
        magic()
        Ly.setv(SYLD, 16, 999999999)
        magic(1692428656)
        magic(2142718166)
        magic(1097748727)
        Ly.setv(mfdz + ((mfcw - 1 - 1) * 48) + mfjg, 4, 0, true)
        return Ly.tt(id .. "\n清除魔法可取消效果")
    end
    if id == "连续大叫" then
        magic()
        magic(1814753890)
        Ly.setv(mfdz + ((mfcw - 1) * 48) + mfjg, 4, 0, true)
        return Ly.tt(id .. "\n清除魔法可取消效果")
    end
    Ly.setv(mfdz + ((mfcw - 1) * 48), 4, id)
    Ly.setv(mfdz + ((mfcw - 1) * 48) + mfjg, 4, 0)
    if name then
        Ly.tt("使用魔法" .. name)
    end
end

-- 魔法换装菜单
mfhz = function()
    local name = {}
    for i = 1, #mfmf do
        name[i] = mfmf[i][1]
    end
    name[#name + 1] = '魔法强化'
    name[#name + 1] = '清除魔法'
    local mf = Ly.cd(name, nil, '选择魔法类型')
    if mf ~= nil and mf < (#name - 1) then
        local id = {}
        for v = 2, #mfmf[mf] do
            id[v] = mfmf[mf][v][1]
        end
        local sc = Ly.cd(id, nil, '选择要使用的魔法')
        if sc ~= nil then
            magic(mfmf[mf][sc][2], mfmf[mf][sc][1])
        else
            return 0
        end
    elseif mf == (#name - 1) then
        magic('魔法强化')
    elseif mf == #name then
        magic()
    end
end

-- 魔法商店
MFSD = function()
    local tmp, tmc = {}, {}
    for i = 1, #SDMF do
        tmp[#tmp + 1] = SDMF[i][1]
    end
    local SDCD = Ly.cd(tmp)
    if SDCD then
        for i = 1, 24 do
            Ly.setr(tmc, mofsd + 0x27 + i, 1, string.byte(SDMF[SDCD][2], i, i) or 0)
        end
        Ly.setr(tmc, mofsd, 4, 1)
        Ly.setr(tmc, mofsd + 0x48, 4, 256, true)
        Ly.set(tmc)
        Ly.tt("点击右上角的问号")
    end
end

-- 身高查询
SGCX = function(a)
    local h = Ly.getv(a + 4, 16)
    local s = Ly.getv(a, 16)
    local tx = string.format("%.18f", s)
    local sgz = string.format("%.18f", h)
    local sg = string.format("%.3f", 7.6 - 8.3 * s - 3 * h)
    local zg = string.format("%.3f", 7.6 - 8.3 * s - 6)
    local za = string.format("%.3f", 7.6 - 8.3 * s + 6)
    sgr = "体型值" .. tx .. "\n身高值" .. sgz .. "\n最高" .. zg .. "号\n最矮" .. za .. "号\n当前" .. sg ..
              "号"
    local ar = Ly.at(sgr, "复制", "返回")
    if ar == 1 then
        gg.copyText(sgr)
    end
end

-- 自身身高
zissg = function()
    SGCX(dxbaddr)
end

-- 星盘好友身高
xinpsg = function()
    local tap = Ly.cd(haoyoumc())
    if tap then
        SGCX(haoysl + 0x28 + py * (tap - 1) + txhyjg)
    end
end

-- 装扮识别
zbsb = function(a)
    local py = {0, 4, 8, 12, 16, 20, 28, 36}
    local fz, fs = {}, {}
    for i = 1, #py do
        fz[i] = Ly.getv(a + py[i], 4)
    end
    for i = 1, #fsid do
        for v = 2, #fsid[i] do
            if fz[i] == fsid[i][v][1] then
                fs[i] = fsid[i][v][2]
            end
        end
        if not fs[i] then
            fs[i] = fsid[i][#fsid[i]][2]
        end
    end
    fssc = fs[1] .. " " .. fs[2] .. " " .. fs[3] .. " " .. fs[4]
    return fssc
end

-- 友谊互动
BEIDON = BDHD[1][2]
DZUOID = BDHD[1][1]
BDDZ = function()
    local ID, CD = Ly.getv(xhaddrs, 4), {}
    for i = 1, #BDHD do
        CD[#CD + 1] = BDHD[i][2]
    end
    local DZCD = Ly.cd({"当前动作：" .. BEIDON, "主动动作:" .. A(42), "被动动作:" .. A(40)})
    if DZCD then
        if DZCD == 1 then
            local XZ = Ly.cd(CD, nil, "当前动作：" .. BEIDON .. "\n选择一个动作")
            if XZ then
                BEIDON = BDHD[XZ][2]
                DZUOID = BDHD[XZ][1]
                if A(42) == "开" then
                    for i = 1, 7 do
                        Ly.setv(BFYY + i * YYJG, 4, DZUOID, true)
                    end
                end
                if A(40) == "开" then
                    Ly.setv(BFYY, 4, DZUOID, true)
                end
                Ly.tt("开启成功")
            end
        end
        if DZCD == 2 then
            Ly.KGS(KG[42], 2, 8, BFYY + 4, 4, YYJG, ID, true)
            Ly.KGS(KG[41], 2, 8, BFYY, 4, YYJG, DZUOID, true)
        end
        if DZCD == 3 then
            Ly.KGR(KG[40], BFYY + 4, 4, ID, true)
            Ly.KGR(KG[39], BFYY, 4, DZUOID, true)
        end
    end
end

-- 点亮小黑
dlxh = function(AR)
    Ly.setv(dianxh + 0x70, 4, 65536, true)
    for i = 1, #AR do
        Ly.setv(dianxh, 4, AR[i], true)
        Ly.sp(1000)
    end
    Ly.setv(dianxh + 0x70, 4, 0, false)
end

-- 骑小黑
qxh = function(a)
    if Ly.getv(qixhdz, 4) ~= a then
        Ly.setv(qixhdz, 4, a, true)
    end
end

-- 距离计算
WZJS = function(a, b)
    return math.sqrt((b[1] - a[1]) ^ 2 + (b[2] - a[2]) ^ 2 + (b[3] - a[3]) ^ 2)
end

-- 强制牵手
QZQS = function(ID)
    if Ly.getv(QIANS, 4) ~= 2 then
        for i = 1, 8 do
            Ly.setv(QIANS + (i - 1) * YYJG, 4, 2, true)
        end
    end
    Ly.setv(QIANSA, 4, 10, true)
    Ly.setv(QIANSA + 0x18, 4, ID, true)
end

-- 社交功能菜单
wanjia = function()
    local wanj, sgdz, idk, xhzb, gysl = {}, {}, {}, {}, {}
    for i = 1, 8 do
        if Ly.getv(xhaddrs + ((i - 1) * wjjg), 4) >= 41249 then
            idk[#idk + 1] = Ly.getv(xhaddrs + ((i - 1) * wjjg), 4) -- 玩家id
            sgdz[#sgdz + 1] = xhaddrs + ((i - 1) * wjjg) + WJSG -- 玩家身高地址
            gysl[#gysl + 1] = Ly.getv(xhaddrs + ((i - 1) * wjjg) + wjgy, 4) -- 玩家光翼数
            xhzb[#xhzb + 1] = {} -- 玩家坐标
            for v = 1, 3 do
                xhzb[#xhzb][v] = Ly.getv(xhaddrs + ((i - 1) * wjjg) + WJZB + ((v - 1) * 4), 16)
            end
            wanj[#wanj + 1] = "玩家" .. #wanj + 1 .. " | " .. zbsb(xhaddrs + ((i - 1) * wjjg) + wjjg2) ..
                                  " | 距离：" .. string.format("%.2f", WZJS(ZBS(), xhzb[#xhzb])) ..
                                  "\n———————————————————————" -- 玩家菜单
        end
    end
    wanj[#wanj + 1] = "取消骑乘"
    wanj[#wanj + 1] = "点亮房间"
    wanj[#wanj + 1] = "刷新房间"
    local wjcd = Ly.cd(wanj)
    if wjcd then
        if wjcd == 1 then
            Ly.tt("这是你自己")
            return
        end
        if wjcd == #wanj then
            Ly.setv(fjsx, 4, 0, true)
            Ly.sp(3000)
            Ly.setv(fjsx, 4, 0, false)
        end
        if wjcd == #wanj - 1 then
            dlxh(idk)
        end
        if wjcd == #wanj - 2 then
            Ly.setv(qixhdz, 4, 0, false)
        end
        if wjcd <= #wanj - 3 then
            local ejwj = Ly.cd({"强制牵手", "点亮小黑", "查看身高", "瞬移小黑", "骑小黑"})
            if ejwj == 1 then
                if gysl[wjcd] > 0 then
                    QZQS(idk[wjcd])
                else
                    Ly.at("禁止对无翼玩家使用该功能")
                end
            end
            if ejwj == 2 then
                dlxh({idk[wjcd]})
            end
            if ejwj == 3 then
                SGCX(sgdz[wjcd])
            end
            if ejwj == 4 then
                sy(xhzb[wjcd])
            end
            if ejwj == 5 then
                qxh(idk[wjcd])
            end
        end
    end
end
-- 一键日常
YJRCK = function()
    CJPZ(WENJMC[6], "a+", "'一键任务','霞谷跑道','原地跑图','星盘收火','星盘送火',")
    jsy()
    local CS
    local YJ = WJPZ(WENJMC[6])
    YJRC = 1
    for i = 1, #YJ do
        local HS
        local JS1 = os.time()
        Ly.tt("开始执行" .. YJ[i])
        for t = 1, #CAIDT do
            for v = 1, #CAIDT[t] do
                if CAIDT[t][v][1] == YJ[i] then
                    HS = CAIDT[t][v][2]
                end
            end
        end
        Ly.zxr(HS)
        Ly.tt(YJ[i] .. "完成\n本项耗时：" .. os.time() - JS1 .. "秒")
        Ly.sp(500)
    end
    YJRC = nil
    DBCZ()
    jsy()
end
YJRCPZ = function()
    CJPZ(WENJMC[6], "a+", "'一键任务','霞谷跑道','原地跑图','星盘收火','星盘送火',")
    local YJ, PD, PR = WJPZ(WENJMC[6]),
        {"一键任务", "霞谷跑道", "原地跑图", "一键季蜡", "星盘收火", "星盘送火", "红石任务",
         "免费魔法", "一键送心", "星盘收心"}, {}
    for i = 1, #PD do
        PR[i] = false
        for v = 1, #YJ do
            if PD[i] == YJ[v] then
                PR[i] = true
            end
        end
    end
    local PZCD = Ly.mcd(PD, PR, "选择一键日常需要执行的功能")
    if PZCD then
        io.open(Cun .. WENJMC[6], "w+"):write("")
        for i = 1, #PD do
            if PZCD[i] == true then
                io.open(Cun .. WENJMC[6], "a+"):write("'" .. PD[i] .. "',")
            end
        end
        Ly.tt("配置已保存")
    end
end

-- 退出脚本
EXIT = function()
    local TC = Ly.at("是否退出脚本？")
    if TC then
        if TC == 1 then
            gg.clearList()
            gg.clearResults()
            print("🌹已退出🌹")
            JIEBTC()
        else
            gg.clearList()
            gg.clearResults()
            print("🌹已退出🌹")
            os.exit()
        end
    end
end

-- 本地位置存档
BDCD = function(S)
    local A = wzpd()
    local B = ZBS()
    Ly.xrwj(Cun .. "CUND", "a+", "\n{'" .. S .. "'," .. A .. ",{" .. B[1] .. ";" .. B[2] .. ";" .. B[3] .. "}},")
    Ly.tt("已存档" .. S)
end

-- 本地位置列表
WZLIEB = function()
    local WJ = "{" .. Ly.bddq(Cun .. "CUND") .. "}"
    local DD = load("return" .. WJ)()
    local tmp = {}
    for i = 1, #DD do
        tmp[#tmp + 1] = DD[i][1]
    end
    local CDCD = Ly.cd(tmp, nil, "点击传送到位置")
    if CDCD then
        qt(DD[CDCD][2])
        Ly.sp(1000)
        sy(DD[CDCD][3])
    end
end

-- 本地位置清空
QKWZ = function()
    os.remove(Cun .. "CUND")
    Ly.xrwj(Cun .. "CUND", "w+", "")
    Ly.tt("已清空所有保存的位置")
end

-- 本地位置删除
SCWZ = function(S)
    local WJ = "{" .. Ly.bddq(Cun .. "CUND") .. "}"
    local DD = load("return" .. WJ)()
    Ly.xrwj(Cun .. "CUND", "w+", "")
    for i = 1, #DD do
        if DD[i][1] ~= S then
            Ly.xrwj(Cun .. "CUND", "a+", "\n{'" .. DD[i][1] .. "'," .. DD[i][2] .. ",{" .. DD[i][3][1] .. ";" ..
                DD[i][3][2] .. ";" .. DD[i][3][3] .. "}},")
        else
            PD = PD + 1
        end
    end
    Ly.tt("位置关键词" .. S .. "共删除" .. PD .. "个")
end

-- 本地位置读取
BDWZ = function(S)
    local WJ = "{" .. Ly.bddq(Cun .. "CUND") .. "}"
    local DD = load("return" .. WJ)()
    for i = 1, #DD do
        if DD[i][1] == S then
            qt(DD[i][2])
            Ly.sp(1000)
        end
    end
end

-- 云位置读取
YDWZ = function(S)
    local WJ = "{" .. Ly.make("") .. "}"
    local DD = load("return" .. WJ)()
    for i = 1, #DD do
        if DD[i][1] == S then
            qt(DD[i][2])
            Ly.sp(1000)
            sy(DD[i][3])
        end
    end
end

-- 言出法随模块
if not io.open(Cun .. "CUND", "r") then
    Ly.xrwj(Cun .. "CUND", "w+", "")
end
SCRK = function(HRS)
    if HRS == "复刻节点" then
        local DHXZR = "HEIJ.png"
        if not io.open(Cun .. DHXZR) then
            io.open(Cun .. DHXZR, "w+"):write(gg.makeRequest("").content)
        end
        image(Cun .. DHXZR)
        return
    end
    if HRS == "禁言321" then
        SESE()
        return
    end
    -- 常用功能模块
    if sousk(HRS, "速度") then
        local S = HRS:match("速度(.+)")
        local S = tonumber(S)
        if S == nil then
            return
        end
        if S > 20 then
            S = 20
        end
        if S < 0 then
            S = 0
        end
        jiasu(S)
        return
    end
    if sousk(HRS, "等级") then
        local S = HRS:match("等级(.+)")
        local S = tonumber(S)
        if S == nil then
            return
        end
        if S > 300 then
            S = 300
        end
        if S < 0 then
            S = 0
        end
        Ly.setv(dengjiaddr, 4, S)
        return
    end
    if sousk(HRS, "开门") then
        KGMS(1)
        return
    end
    if sousk(HRS, "关门") then
        KGMS(0)
        return
    end
    if sousk(HRS, "开灯") then
        local S = HRS:match("开灯(.+)")
        local R = 0
        if S == '1' then
            R = 99
        end
        if S == '2' then
            R = 9999999
        end
        if S == '3' then
            R = 99999999999999999999999999999999999999
        end
        Ly.setv(SYLD, 16, R, true)
        HRS = "闪耀"
    end
    if sousk(HRS, "关灯") then
        Ly.setv(SYLD, 16, 0, false)
        HRS = "清除"
    end
    if sousk(HRS, "复制坐标") then
        local G = ZBS()
        gg.fuzhi("{" .. G[1] .. ";" .. G[2] .. ";" .. G[3] .. "}")
        return
    end
    if sousk(HRS, "瞬移") then
        local S = HRS:match("瞬移(.+)")
        sy(S)
        return
    end

    -- 动画变化模块
    if sousk(HRS, "切换") then
        local S = HRS:match("切换(.+)")
        if S == nil then
            return
        end
        for i = 1, #DHMF do
            if S == DHMF[i][2] then
                MFKTK(DHMF[i][1])
            end
        end
        return
    end

    -- 使用说明
    if HRS == "使用说明" then
        Ly.at(GNSYS)
        return
    end

    -- 本地位置存档模块
    if sousk(HRS, "保存位置") then
        local S = HRS:match("位置(.+)")
        if S == nil then
            Ly.tt("未命名位置")
            return
        end
        BDCD(S)
        return
    end
    if sousk(HRS, "位置列表") then
        WZLIEB()
        return
    end

    -- 云位置存档模块
    if sousk(HRS, "上传位置") then
        local S = HRS:match("上传位置(.+)")
        if S == nil then
            Ly.tt("未命名位置")
            return
        end
        YWZSC(S)
        return
    end
    if sousk(HRS, "云位置表") then
        YWZLB()
        return
    end

    -- 删除本地位置
    if HRS == "清空位置" then
        QKWZ()
        return
    end
    if sousk(HRS, "删除位置") then
        local PD = 0
        local S = HRS:match("删除位置(.+)")
        if S == nil then
            return
        end
        SCWZ()
        return
    end

    -- 本地位置读取
    if sousk(HRS, "传送位置") then
        local PD = 0
        local S = HRS:match("传送位置(.+)")
        if S == nil then
            return
        end
        BDWZ(S)
        return
    end

    -- 云端位置读取
    if sousk(HRS, "云传送") then
        local PD = 0
        local S = HRS:match("云传送(.+)")
        if S == nil then
            return
        end
        YDWZ(S)
        return
    end

    -- 功能搜索模块
    local tmp, tma, tmb, tmr = {}, {}, {}, {}
    for i = 1, #map do
        if sousk(map[i][3], HRS) then
            tmp[#tmp + 1] = map[i][3] .. "(地图)"
            tma[#tma + 1] = map[i][4]
            tmb[#tmb + 1] = 0
        end
    end
    for i = 1, #CAIDT do
        for v = 1, #CAIDT[i] do
            if sousk(CAIDT[i][v][1], HRS) then
                tmp[#tmp + 1] = CAIDT[i][v][1] .. "(功能)"
                tma[#tma + 1] = CAIDT[i][v][2]
                tmb[#tmb + 1] = 1
            end
        end
    end
    for i = 1, #mfmf do
        for v = 2, #mfmf[i] do
            if sousk(mfmf[i][v][1], HRS) then
                tmp[#tmp + 1] = mfmf[i][v][1] .. "(魔法)"
                tma[#tma + 1] = mfmf[i][v][2]
                tmb[#tmb + 1] = 2
            end
        end
    end
    if io.open(Cun .. "HAOYOUSS", "r") then
        Ly.fb(haoysl - Jo)
        local HYMC, HYID = haoyoumc(), haoyouid()
        for i = 1, #HYMC do
            if sousk(HYMC[i], HRS) then
                tmp[#tmp + 1] = HYMC[i] .. "(好友)"
                tma[#tma + 1] = HYID[i]
                tmr[#tmr + 1] = i
                tmb[#tmb + 1] = 3
            end
        end
    end
    if io.open(Cun .. "XIANZHUSS", "r") then
        for i = 1, #XZCD do
            for v = 2, #XZCD[i] do
                if sousk(XZCD[i][v][2], HRS) then
                    tmp[#tmp + 1] = XZCD[i][v][2] .. "(" .. XZCD[i][1] .. ")"
                    tma[#tma + 1] = XZCD[i][v][1]
                    tmb[#tmb + 1] = 4
                end
            end
        end
    end
    if #tmp == 1 then
        if tmb[1] == 0 then
            qt(tma[1])
        end
        if tmb[1] == 1 then
            Ly.zxr(tma[1])
        end
        if tmb[1] == 2 then
            magic(tma[1], tmp[1])
        end
        if tmb[1] == 3 then
            HYSSMK(tmp[1], tma[1], tmr[1])
        end
        if tmb[1] == 4 then
            Ly.JDS(tma[1], tmp[1])
        end
    elseif #tmp >= 2 then
        local souscd = Ly.cd(tmp, nil, "关键词：" .. HRS .. "\n一共有" .. #tmp .. "个搜索结果")
        if souscd then
            if tmb[souscd] == 0 then
                qt(tma[souscd])
            end
            if tmb[souscd] == 1 then
                Ly.zxr(tma[souscd])
            end
            if tmb[souscd] == 2 then
                magic(tma[souscd], tmp[souscd])
            end
            if tmb[souscd] == 3 then
                HYSSMK(tmp[souscd], tma[souscd], tmr[souscd])
            end
            if tmb[souscd] == 4 then
                Ly.JDS(tma[souscd], tmp[souscd])
            end
        end
    else
        Ly.tt("无搜索结果")
    end
end

local SYRS = [[

🌹本功能为脚本扩展功能
🌹第一次使用请输入：“使用说明” 

🌹输入指令：
]]
-- 功能搜索
gnsous = function()
    local HYSKG, XZSKG = false, false
    if io.open(Cun .. "HAOYOUSS", "r") then
        HYSKG = true
    end
    if io.open(Cun .. "XIANZHUSS", "r") then
        XZSKG = true
    end
    local sour = gg.prompt({SYRS, "启用搜索好友", "启用搜索先祖"}, {"", HYSKG, XZSKG},
        {"text", "checkbox", "checkbox"})
    if sour then
        if sour[2] == true then
            io.open(Cun .. "HAOYOUSS", "w+"):write("")
        else
            os.remove(Cun .. "HAOYOUSS")
        end
        if sour[3] == true then
            io.open(Cun .. "XIANZHUSS", "w+"):write("")
        else
            os.remove(Cun .. "XIANZHUSS")
        end
        SCRK(sour[1])
    end
end

-- 后台模式
HQWB = function()
    local WBS = WBEN(WBPD, 200)
    local WBK = WBS:match('"msg":"(.-)",')
    return WBK
end
HTMS = function()
    local WBS = HQWB()
    Ly.at(GNSYS)
    while true do
        if HQWB() ~= WBS then
            local HQZ = HQWB()
            if HQZ ~= nil then
                if HQZ == "退出模式" then
                    Ly.tt("已退出模式")
                    break
                end
                if HQZ == "退出本子" then
                    EXIT()
                end
                SCRK(HQZ)
            end
            local tmk = {}
            for t = 1, 48 do
                Ly.setr(tmk, WBPD + (t - 1), 4, 0)
            end
            Ly.set(tmk)
            WBS = HQWB()
        end
        Ly.sp(1000)
    end
end

-- 主菜单
Ly.ZCD = function()
    local SS = BQSC()
    local tmc = {}
    for i = 1, #CAIDR do
        tmc[#tmc + 1] = SS[i] .. CAIDR[i][1] .. SS[i]
    end
    tmc[#tmc + 1] = "🚫退出脚本🚫"
    local CDP = Ly.cd(tmc, nil, ZCD)
    if CDP == #tmc then
        EXIT()
    end
    if CDP then
        Ly.zxr(CAIDR[CDP][2])
    end
end

-- 功能菜单
GNCD = function()
    CDL = 1
    local SS = BQSC()
    local tmc = {}
    for i = 1, #CAIDA do
        tmc[#tmc + 1] = SS[i] .. CAIDA[i] .. SS[i]
    end
    tmc[#tmc + 1] = "🚫返回上页🚫"
    if FX ~= nil then
        Ly.Cdb(CAIDT[FX], CAIDA[FX])
    else
        local CDP = Ly.cd(tmc, nil, ZCD)
        if CDP == #tmc then
            CDL = nil
            Ly.ZCD()
            return
        end
        if CDP then
            FX = CDP
            Ly.Cdb(CAIDT[FX], CAIDA[FX])
        end
    end
end

while true do
    Ly.sp(50)
    if gg.isVisible() then
        gg.setVisible(false)
        CDB()
        if CDL == nil then
            Ly.ZCD()
        else
            GNCD()
        end
    end
end
