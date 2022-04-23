// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.game.snowwar.ui.SnowWarUI

package com.sulake.habbo.game.snowwar.ui
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.avatar._SafeStr_1875;
    import com.sulake.habbo.game.snowwar.SnowWarEngine;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.habbo.game.snowwar.utils.SnowWarAnimatedWindowElement;
    import flash.utils.Timer;
    import com.sulake.habbo.game.snowwar.utils.WindowUtils;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.avatar._SafeStr_3138;
    import flash.display.BitmapData;
    import com.sulake.core.window.events.WindowMouseEvent;
    import _-PD.Game2ExitGameMessageComposer;
    import flash.events.TimerEvent;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.geom.Point;

    public class SnowWarUI implements _SafeStr_13, _SafeStr_1875 
    {

        private static const EMPTY_AMMO_FLASH_FRAMES:int = 4;
        private static const EMPTY_AMMO_FRAME_LENGTH:int = 75;
        private static const SCORE_FLASH_FRAMES:int = 4;
        private static const SCORE_FRAME_LENGTH:int = 50;
        private static const MAX_SNOWBALLS:int = 5;
        private static const MAX_ENERGY:int = 5;

        private var _SafeStr_5466:SnowWarEngine;
        private var _SafeStr_6845:_SafeStr_3133;
        private var _snowballs:_SafeStr_3133;
        private var _SafeStr_6846:_SafeStr_3133;
        private var _SafeStr_4582:_SafeStr_3133;
        private var _SafeStr_6168:_SafeStr_3133;
        private var _exitConfirmation:_SafeStr_3133;
        private var _checksumIndicatorColor:RGBColor;
        private var _tweenColor:RGBColor;
        private var _SafeStr_6847:_SafeStr_3264;
        private var _SafeStr_4036:Boolean = false;
        private var _SafeStr_6853:int = 1;
        private var _timeSinceLastUpdate:uint;
        private var _SafeStr_6849:int = -1;
        private var _SafeStr_6850:int = 5;
        private var _makeSnowballButton:_SafeStr_3264;
        private var _makingSnowballs:Boolean = false;
        private var _SafeStr_6852:int = 5;
        private var _progressIcon:_SafeStr_3264;
        private var _loadIcon:SnowWarAnimatedWindowElement;
        private var _emptyAmmoFlash:_SafeStr_3264;
        private var _emptyAmmoAnimation:SnowWarAnimatedWindowElement;
        private var _scoreBackground:_SafeStr_3264;
        private var _SafeStr_6851:int = 0;
        private var _scoreBackgroundAsset:String = "";
        private var _SafeStr_6848:Timer;
        private var _SafeStr_6844:Boolean;

        public function SnowWarUI(_arg_1:SnowWarEngine)
        {
            _SafeStr_5466 = _arg_1;
            _SafeStr_5466.windowManager.getDesktop(1).visible = false;
            _SafeStr_6844 = _SafeStr_5466.sessionDataManager.hasSecurity(4);
            if (_SafeStr_6844)
            {
                _checksumIndicatorColor = new RGBColor();
                _tweenColor = new RGBColor(0xFFFFFF);
            };
        }

        public function dispose():void
        {
            _SafeStr_5466.windowManager.getDesktop(1).visible = true;
            _SafeStr_5466 = null;
            if (_SafeStr_6845)
            {
                _SafeStr_6845.dispose();
                _SafeStr_6845 = null;
            };
            if (_snowballs)
            {
                _makeSnowballButton = null;
                _progressIcon = null;
                _emptyAmmoFlash = null;
                _snowballs.dispose();
                _snowballs = null;
            };
            if (_SafeStr_6846)
            {
                _scoreBackground = null;
                _SafeStr_6846.dispose();
                _SafeStr_6846 = null;
            };
            if (_SafeStr_4582)
            {
                _SafeStr_4582.dispose();
                _SafeStr_4582 = null;
            };
            if (_SafeStr_6168)
            {
                _SafeStr_6168.dispose();
                _SafeStr_6168 = null;
            };
            if (_SafeStr_6847)
            {
                _SafeStr_6847.dispose();
                _SafeStr_6847 = null;
            };
            if (_emptyAmmoAnimation != null)
            {
                _emptyAmmoAnimation.dispose();
                _emptyAmmoAnimation = null;
            };
            if (_exitConfirmation)
            {
                _exitConfirmation.dispose();
                _exitConfirmation = null;
            };
            if (_SafeStr_6848)
            {
                _SafeStr_6848.removeEventListener("timerComplete", onTimerHider);
                _SafeStr_6848.stop();
                _SafeStr_6848 = null;
            };
            disposeLoadIcon();
            _SafeStr_4036 = true;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function init():void
        {
            _SafeStr_6845 = (WindowUtils.createWindow("snowwar_exit") as _SafeStr_3133);
            _SafeStr_6845.addEventListener("WME_CLICK", onExit);
            _SafeStr_6845.x = 0;
            _SafeStr_6845.y = 10;
            _snowballs = (WindowUtils.createWindow("snowwar_snowballs") as _SafeStr_3133);
            var _local_1:_SafeStr_3109 = _snowballs.findChildByName("make_snowball");
            _local_1.addEventListener("WME_DOWN", onMakeSnowballDown);
            _local_1.addEventListener("WME_UP", onMakeSnowballUp);
            _local_1.addEventListener("WME_OUT", onMakeSnowballUp);
            _snowballs.center();
            _snowballs.x = 10;
            _makeSnowballButton = (_snowballs.findChildByName("makeSnowballImage") as _SafeStr_3264);
            _emptyAmmoFlash = (_snowballs.findChildByName("emptyFlashImage") as _SafeStr_3264);
            _emptyAmmoFlash.visible = false;
            _emptyAmmoAnimation = new SnowWarAnimatedWindowElement(_SafeStr_5466.assets, _emptyAmmoFlash, "ui_no_balls_", 4, 75, true);
            _progressIcon = (_snowballs.findChildByName("ballProgress") as _SafeStr_3264);
            _SafeStr_6846 = (WindowUtils.createWindow("snowwar_own_stats") as _SafeStr_3133);
            _SafeStr_6846.x = 10;
            _SafeStr_6846.y = ((_SafeStr_6846.desktop.height - _SafeStr_6846.height) - 10);
            _scoreBackground = (_SafeStr_6846.findChildByName("backgroundFlashImage") as _SafeStr_3264);
            updateUserImage();
            _SafeStr_6168 = (WindowUtils.createWindow("snowwar_team_scores") as _SafeStr_3133);
            _SafeStr_6168.x = ((_SafeStr_6168.desktop.width - _SafeStr_6168.width) - 10);
            _SafeStr_6168.y = 10;
            _SafeStr_4582 = (WindowUtils.createWindow("snowwar_timer") as _SafeStr_3133);
            _SafeStr_4582.x = ((_SafeStr_4582.desktop.width - _SafeStr_4582.width) - 50);
            _SafeStr_4582.y = 105;
            timer = 0;
            _SafeStr_6847 = (WindowUtils.createWindow("counter") as _SafeStr_3264);
            _SafeStr_6847.center();
            if (_SafeStr_6844)
            {
                _SafeStr_4582.getChildByName("checksumIndicator").visible = true;
                _checksumIndicatorColor.fromInt(_SafeStr_4582.color);
            };
            _SafeStr_6850 = 5;
        }

        public function avatarImageReady(_arg_1:String):void
        {
            updateUserImage();
        }

        private function updateUserImage():void
        {
            var _local_1:* = null;
            var _local_3:String = _SafeStr_5466.sessionDataManager.figure;
            var _local_2:String = _SafeStr_5466.sessionDataManager.gender;
            var _local_4:_SafeStr_3138 = _SafeStr_5466.avatarManager.createAvatarImage(_local_3, "h", _local_2, this);
            if (_local_4 != null)
            {
                _local_4.setDirection("full", 2);
                _local_1 = _local_4.getCroppedImage("head");
                _local_4.dispose();
                WindowUtils.setElementImage(_SafeStr_6846.findChildByName("user_image"), _local_1);
                _local_1.dispose();
            };
        }

        private function getBitmap(_arg_1:String):BitmapData
        {
            return (_SafeStr_5466.assets.getAssetByName(_arg_1).content as BitmapData);
        }

        private function getElement(_arg_1:_SafeStr_3133, _arg_2:String):_SafeStr_3109
        {
            return (_arg_1.findChildByName(_arg_2));
        }

        private function onMakeSnowballDown(_arg_1:WindowMouseEvent):void
        {
            makeSnowballButtonPressed(true);
            if (_SafeStr_5466.makeSnowball())
            {
                startWaitingForSnowball();
            };
        }

        private function onMakeSnowballUp(_arg_1:WindowMouseEvent):void
        {
            makeSnowballButtonPressed(false);
        }

        public function startWaitingForSnowball():void
        {
            if (_loadIcon != null)
            {
                _loadIcon.dispose();
                _loadIcon = null;
            };
            _loadIcon = new SnowWarAnimatedWindowElement(_SafeStr_5466.assets, _progressIcon, "load_", 8);
            SnowWarEngine.playSound("HBSTG_snowwar_make_snowball");
        }

        public function stopWaitingForSnowball():void
        {
            disposeLoadIcon();
            SnowWarEngine.stopSound("HBSTG_snowwar_make_snowball");
            if (_makingSnowballs)
            {
                onMakeSnowballDown(null);
            };
        }

        private function disposeLoadIcon():void
        {
            if (_loadIcon != null)
            {
                _loadIcon.dispose();
                _loadIcon = null;
            };
        }

        private function onExit(_arg_1:WindowMouseEvent):void
        {
            if (!_exitConfirmation)
            {
                _exitConfirmation = (WindowUtils.createWindow("snowwar_exit_confirmation") as _SafeStr_3133);
                _exitConfirmation.findChildByName("yes").addEventListener("WME_CLICK", confirmationHandler);
                _exitConfirmation.findChildByName("no").addEventListener("WME_CLICK", confirmationHandler);
                _exitConfirmation.findChildByTag("close").addEventListener("WME_CLICK", confirmationHandler);
            }
            else
            {
                _exitConfirmation.visible = true;
                _exitConfirmation.activate();
            };
        }

        private function confirmationHandler(_arg_1:WindowMouseEvent):void
        {
            if (_arg_1.window.name == "yes")
            {
                _SafeStr_5466.send(new Game2ExitGameMessageComposer());
                _SafeStr_5466.resetGameSession();
                _SafeStr_5466.resetRoomSession();
            }
            else
            {
                _exitConfirmation.visible = false;
            };
        }

        public function set snowballs(_arg_1:int):void
        {
            var _local_3:int;
            _local_3 = 0;
            while (_local_3 < 5)
            {
                _snowballs.findChildByName(("ball_" + _local_3)).visible = (_local_3 < _arg_1);
                _local_3++;
            };
            _SafeStr_6852 = _arg_1;
            var _local_2:_SafeStr_3109 = _snowballs.findChildByName(("ball_" + _arg_1));
            if (_local_2 != null)
            {
                _progressIcon.x = _local_2.x;
                _progressIcon.y = _local_2.y;
            };
        }

        public function set ownScore(_arg_1:int):void
        {
            WindowUtils.setCaption(_SafeStr_6846.findChildByName("personal_score"), _arg_1.toString());
        }

        public function set timer(_arg_1:int):void
        {
            if (_SafeStr_6844)
            {
                if (_checksumIndicatorColor)
                {
                    _checksumIndicatorColor.tweenTo(_tweenColor);
                    _SafeStr_4582.getChildByName("checksumIndicator").color = _checksumIndicatorColor.rgb;
                };
            };
            if (_SafeStr_6849 == _arg_1)
            {
                return;
            };
            _SafeStr_6849 = _arg_1;
            var _local_2:String = ("" + int((_arg_1 / 60)));
            var _local_3:String = ("" + (_arg_1 % 60));
            if (_local_2 < 10)
            {
                _local_2 = ("0" + _local_2);
            };
            if (_local_3 < 10)
            {
                _local_3 = ("0" + _local_3);
            };
            WindowUtils.showElement(_SafeStr_4582, "time_left");
            WindowUtils.setCaption(_SafeStr_4582.findChildByName("time_left"), ((_local_2 + ":") + _local_3));
            if (((_arg_1 <= 5) && (_arg_1 > 0)))
            {
                SnowWarEngine.playSound("HBST_call_for_help");
                if (!_SafeStr_6848)
                {
                    _SafeStr_6848 = new Timer(500, 1);
                    _SafeStr_6848.addEventListener("timerComplete", onTimerHider);
                };
                _SafeStr_6848.reset();
                _SafeStr_6848.start();
            };
        }

        private function onTimerHider(_arg_1:TimerEvent):void
        {
            if (_SafeStr_4582)
            {
                WindowUtils.hideElement(_SafeStr_4582, "time_left");
            };
        }

        public function set hitPoints(_arg_1:int):void
        {
            if (_SafeStr_6850 != _arg_1)
            {
                WindowUtils.setElementImage(getElement(_SafeStr_6846, "energy_bar"), getBitmap(("ui_me_health_" + Math.min(5, _arg_1))));
                _SafeStr_6850 = _arg_1;
            };
        }

        public function showChecksumError(_arg_1:uint):void
        {
            if (_SafeStr_6844)
            {
                _SafeStr_4582.color = _arg_1;
                if (_checksumIndicatorColor)
                {
                    _checksumIndicatorColor.fromInt(_arg_1);
                };
            };
        }

        public function initCounter():void
        {
            _timeSinceLastUpdate = 0;
            _SafeStr_6853 = 1;
        }

        public function update(_arg_1:uint):void
        {
            updateAmmoDisplay();
            updateCounterImage(_arg_1);
            updateScoreFlash(_arg_1);
            updateTeamScores();
        }

        private function updateScoreFlash(_arg_1:uint):void
        {
            var _local_2:int;
            if (_SafeStr_6851 > 0)
            {
                _local_2 = int(((_SafeStr_6851 / 50) + 1));
                if (_local_2 > 4)
                {
                    _SafeStr_6851 = 0;
                    _scoreBackground.visible = false;
                }
                else
                {
                    _SafeStr_6851 = (_SafeStr_6851 + _arg_1);
                    _scoreBackground.visible = true;
                    WindowUtils.setElementImage(_scoreBackground, getBitmap((_scoreBackgroundAsset + _local_2)));
                };
            };
        }

        public function flashOwnScore(_arg_1:Boolean):void
        {
            _SafeStr_6851 = 1;
            _scoreBackgroundAsset = ((_arg_1) ? "ui_me_plus_" : "ui_me_minus_");
        }

        private function updateAmmoDisplay():void
        {
            _emptyAmmoFlash.visible = ((_SafeStr_6852 == 0) && (_loadIcon == null));
        }

        private function updateCounterImage(_arg_1:uint):void
        {
            var _local_2:* = null;
            var _local_3:* = null;
            var _local_5:Boolean;
            _timeSinceLastUpdate = (_timeSinceLastUpdate + _arg_1);
            if (_SafeStr_6853 < 6)
            {
                if (_timeSinceLastUpdate >= 1000)
                {
                    _local_5 = true;
                    _timeSinceLastUpdate = 0;
                };
            }
            else
            {
                if (_SafeStr_6853 < 11)
                {
                    if (_timeSinceLastUpdate > 100)
                    {
                        _local_5 = true;
                        _timeSinceLastUpdate = 0;
                    };
                }
                else
                {
                    if (_SafeStr_6847)
                    {
                        _SafeStr_6847.dispose();
                        _SafeStr_6847 = null;
                    };
                };
            };
            if ((((!(_local_5)) || (_SafeStr_4036)) || (!(_SafeStr_6847))))
            {
                return;
            };
            var _local_4:BitmapDataAsset = (_SafeStr_5466.assets.getAssetByName(padName("explosion", _SafeStr_6853)) as BitmapDataAsset);
            if (_local_4)
            {
                _local_2 = (_local_4.content as BitmapData);
                if (!_SafeStr_6847.bitmap)
                {
                    _SafeStr_6847.bitmap = new BitmapData(_SafeStr_6847.width, _SafeStr_6847.height, true, 0xFFFFFF);
                };
                _SafeStr_6847.bitmap.fillRect(_SafeStr_6847.bitmap.rect, 0xFFFFFF);
                _local_3 = new Point(-(_local_4.offset.x), -(_local_4.offset.y));
                _SafeStr_6847.bitmap.copyPixels(_local_2, _local_2.rect, _local_3, null, null, true);
                _SafeStr_6847.invalidate();
            };
            _SafeStr_6853++;
        }

        private function padName(_arg_1:String, _arg_2:int, _arg_3:int=4):String
        {
            var _local_4:String = _arg_2.toString();
            while (_local_4.length < _arg_3)
            {
                _local_4 = ("0" + _local_4);
            };
            return (_arg_1 + _local_4);
        }

        private function updateTeamScores():void
        {
            var _local_1:Array = _SafeStr_5466.gameArena.getTeamScores();
            if (_local_1.length >= 2)
            {
                WindowUtils.setCaption(_SafeStr_6168.findChildByName("score_blue"), _local_1[0]);
                WindowUtils.setCaption(_SafeStr_6168.findChildByName("score_red"), _local_1[1]);
            };
        }

        private function makeSnowballButtonPressed(_arg_1:Boolean):void
        {
            if (_makingSnowballs != _arg_1)
            {
                WindowUtils.setElementImage(_makeSnowballButton, getBitmap(("ui_make_balls_" + ((_arg_1) ? "down" : "up"))));
            };
            _makingSnowballs = _arg_1;
        }


    }
}//package com.sulake.habbo.game.snowwar.ui

class RGBColor 
{

    /*private*/ var _r:uint;
    /*private*/ var _g:uint;
    /*private*/ var _b:uint;
    /*private*/ var _a:uint;

    public function RGBColor(_arg_1:uint=0)
    {
        fromInt(_arg_1);
    }

    public function get r():uint
    {
        return (_r);
    }

    public function get g():uint
    {
        return (_g);
    }

    public function get b():uint
    {
        return (_b);
    }

    public function get a():uint
    {
        return (_a);
    }

    public function fromInt(_arg_1:uint):void
    {
        _a = ((_arg_1 >> 24) & 0xFF);
        _r = ((_arg_1 >> 16) & 0xFF);
        _g = ((_arg_1 >> 8) & 0xFF);
        _b = ((_arg_1 >> 0) & 0xFF);
    }

    public function get rgb():uint
    {
        return ((((_a << 24) | (_r << 16)) | (_g << 8)) | _b);
    }

    public function tweenTo(_arg_1:RGBColor):void
    {
        _a = (_a + ((_arg_1.a - a) / 24));
        _r = (_r + ((_arg_1.r - r) / 24));
        _g = (_g + ((_arg_1.g - g) / 24));
        _b = (_b + ((_arg_1.b - b) / 24));
    }


}


// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1875 = "_-R1S" (String#2190, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3138 = "_-L1S" (String#1270, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_4582 = "_-T1P" (String#619, DoABC#4)
// _SafeStr_5466 = "_-Z2" (String#393, DoABC#4)
// _SafeStr_6168 = "_-SQ" (String#3767, DoABC#4)
// _SafeStr_6844 = "_-TZ" (String#10669, DoABC#4)
// _SafeStr_6845 = "_-BN" (String#7187, DoABC#4)
// _SafeStr_6846 = "_-n1c" (String#5161, DoABC#4)
// _SafeStr_6847 = "_-8i" (String#3634, DoABC#4)
// _SafeStr_6848 = "_-NN" (String#6473, DoABC#4)
// _SafeStr_6849 = "_-Lz" (String#18876, DoABC#4)
// _SafeStr_6850 = "_-21E" (String#11689, DoABC#4)
// _SafeStr_6851 = "_-G1W" (String#7382, DoABC#4)
// _SafeStr_6852 = "_-na" (String#18141, DoABC#4)
// _SafeStr_6853 = "_-e1p" (String#8125, DoABC#4)


