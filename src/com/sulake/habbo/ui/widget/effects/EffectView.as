﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.effects.EffectView

package com.sulake.habbo.ui.widget.effects
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.ui.widget.memenu._SafeStr_3271;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.ITextWindow;
    import flash.utils.Timer;
    import flash.events.Event;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components._SafeStr_3122;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.assets.BitmapDataAsset;

    public class EffectView 
    {

        private const UPDATE_TIMER_MS:int = 1000;

        private var _SafeStr_4981:EffectsWidget;
        private var _window:_SafeStr_3133;
        private var _SafeStr_4386:_SafeStr_3271;
        private var _bar:_SafeStr_3109;
        private var _maxWidth:Number;
        private var _SafeStr_5896:ITextWindow;
        private var _SafeStr_4582:Timer;
        private var _hilite:_SafeStr_3109;

        public function EffectView(_arg_1:EffectsWidget, _arg_2:_SafeStr_3271)
        {
            _SafeStr_4386 = _arg_2;
            _SafeStr_4981 = _arg_1;
            _SafeStr_4582 = new Timer(1000);
            _SafeStr_4582.addEventListener("timer", onUpdate);
            update();
        }

        public function get effect():_SafeStr_3271
        {
            return (_SafeStr_4386);
        }

        public function dispose():void
        {
            if (_SafeStr_4582 != null)
            {
                _SafeStr_4582.stop();
                _SafeStr_4582.removeEventListener("timer", onUpdate);
                _SafeStr_4582 = null;
            };
            _SafeStr_4981 = null;
            _SafeStr_4386 = null;
            _bar = null;
            _SafeStr_5896 = null;
            _hilite = null;
            if (_window != null)
            {
                _window.dispose();
                _window = null;
            };
        }

        public function get window():_SafeStr_3133
        {
            return (_window);
        }

        private function onUpdate(_arg_1:Event=null):void
        {
            var _local_2:Number;
            if (_bar == null)
            {
                _SafeStr_4582.stop();
                return;
            };
            if (_SafeStr_4386.isActive)
            {
                _local_2 = (_SafeStr_4386.secondsLeft / _SafeStr_4386.duration);
                _bar.width = (_local_2 * _maxWidth);
            }
            else
            {
                _bar.width = 0;
                _SafeStr_4582.stop();
            };
            setTimeLeft();
        }

        private function setTimeLeft():void
        {
            var _local_8:* = null;
            var _local_7:int;
            var _local_9:int;
            var _local_1:int;
            var _local_3:int;
            var _local_2:int;
            var _local_5:* = null;
            var _local_4:* = null;
            var _local_6:* = null;
            if (_SafeStr_5896 == null)
            {
                _SafeStr_5896 = (_window.findChildByName("time_left") as ITextWindow);
                if (_SafeStr_5896 == null)
                {
                    return;
                };
            };
            if (!_SafeStr_4386.isActive)
            {
                _SafeStr_5896.caption = "${widgets.memenu.effects.activate}";
                return;
            };
            if (_SafeStr_4386.secondsLeft > 86400)
            {
                _SafeStr_5896.caption = "${widgets.memenu.effects.active.daysleft}";
                _local_8 = _SafeStr_5896.text;
                _local_7 = int(Math.floor((_SafeStr_4386.secondsLeft / 86400)));
                _local_8 = _local_8.replace("%days_left%", _local_7);
            }
            else
            {
                _SafeStr_5896.caption = "${widgets.memenu.effects.active.timeleft}";
                _local_8 = _SafeStr_5896.text;
                _local_9 = _SafeStr_4386.secondsLeft;
                _local_1 = int(Math.floor((_local_9 / 3600)));
                _local_3 = int((Math.floor((_local_9 / 60)) % 60));
                _local_2 = (_local_9 % 60);
                _local_5 = ((_local_1 < 10) ? "0" : "");
                _local_4 = ((_local_3 < 10) ? "0" : "");
                _local_6 = ((_local_2 < 10) ? "0" : "");
                if (_local_1 > 0)
                {
                    _local_8 = _local_8.replace("%time_left%", (((((((_local_5 + _local_1) + ":") + _local_4) + _local_3) + ":") + _local_6) + _local_2));
                }
                else
                {
                    _local_8 = _local_8.replace("%time_left%", ((((_local_4 + _local_3) + ":") + _local_6) + _local_2));
                };
            };
            _SafeStr_5896.text = _local_8;
        }

        public function update():void
        {
            var _local_7:* = null;
            var _local_5:* = null;
            var _local_4:* = null;
            if (!_window)
            {
                _window = (_SafeStr_4981.windowManager.createWindow("", "", 4, 0, 16) as _SafeStr_3133);
            };
            while (_window.numChildren > 0)
            {
                _local_7 = _window.removeChildAt(0);
                _local_7.dispose();
            };
            _bar = null;
            _hilite = null;
            _SafeStr_5896 = null;
            var _local_2:String = "";
            if (_SafeStr_4386.isInUse)
            {
                _local_2 = "memenu_effect_selected";
            }
            else
            {
                if (_SafeStr_4386.isActive)
                {
                    _local_2 = "memenu_effect_unselected";
                }
                else
                {
                    _local_2 = "memenu_effect_inactive";
                };
            };
            _local_5 = (_SafeStr_4981.assets.getAssetByName(_local_2) as XmlAsset);
            var _local_6:_SafeStr_3133 = (_SafeStr_4981.windowManager.buildFromXML((_local_5.content as XML)) as _SafeStr_3133);
            _window.addChild(_local_6);
            var _local_3:ITextWindow = (_window.findChildByName("effect_name") as ITextWindow);
            if (_local_3 != null)
            {
                _local_3.caption = (("${fx_" + _SafeStr_4386.type) + "}");
            };
            var _local_8:ITextWindow = (_window.findChildByName("effect_amount") as ITextWindow);
            if (_local_8 != null)
            {
                _local_8.caption = (_SafeStr_4386.amountInInventory + "");
            };
            var _local_1:_SafeStr_3133 = (_window.findChildByName("effect_amount_bg1") as _SafeStr_3133);
            if (_SafeStr_4386.amountInInventory < 2)
            {
                if (_local_1 != null)
                {
                    _local_1.visible = false;
                };
            };
            if (_local_2 == "memenu_effect_inactive")
            {
                _local_4 = (_window.findChildByName("activate_effect") as _SafeStr_3122);
                if (_local_4 != null)
                {
                    _local_4.addEventListener("WME_CLICK", onMouseEvent);
                };
            }
            else
            {
                _local_6.addEventListener("WME_CLICK", onMouseEvent);
                if (_SafeStr_4386.isActive)
                {
                    _local_6.addEventListener("WME_OVER", onMouseEvent);
                    _local_6.addEventListener("WME_OUT", onMouseEvent);
                };
                if (_SafeStr_4386.isInUse)
                {
                    setElementImage("effect_hilite", "memenu_fx_pause");
                }
                else
                {
                    setElementImage("effect_hilite", "memenu_fx_play");
                };
                _hilite = _window.findChildByName("effect_hilite");
                _hilite.visible = false;
            };
            setTimeLeft();
            _bar = _window.findChildByName("loader_bar");
            if (_bar != null)
            {
                _maxWidth = _bar.width;
                _SafeStr_4582.start();
                onUpdate();
            };
            if (_SafeStr_4386.icon)
            {
                setElementBitmap("effect_icon", _SafeStr_4386.icon);
            };
            _window.rectangle = _local_6.rectangle;
        }

        private function setElementBitmap(_arg_1:String, _arg_2:BitmapData):void
        {
            var _local_3:_SafeStr_3264 = (_window.findChildByName(_arg_1) as _SafeStr_3264);
            if (_local_3 != null)
            {
                if (_local_3.bitmap)
                {
                    _local_3.bitmap.dispose();
                };
                _local_3.bitmap = new BitmapData(_local_3.width, _local_3.height, true, 0);
                _local_3.bitmap.copyPixels(_arg_2, _arg_2.rect, new Point(0, 0));
            };
        }

        private function onMouseEvent(_arg_1:WindowMouseEvent):void
        {
            switch (_arg_1.type)
            {
                case "WME_OVER":
                    if (_hilite != null)
                    {
                        _hilite.visible = true;
                    };
                    return;
                case "WME_OUT":
                    if (_hilite != null)
                    {
                        _hilite.visible = false;
                    };
                    return;
                case "WME_CLICK":
                    _SafeStr_4981.selectEffect(_SafeStr_4386.type, _SafeStr_4386.isInUse);
                    return;
            };
        }

        private function setElementImage(_arg_1:String, _arg_2:String):void
        {
            var _local_4:BitmapDataAsset = (_SafeStr_4981.assets.getAssetByName(_arg_2) as BitmapDataAsset);
            var _local_3:BitmapData = (_local_4.content as BitmapData);
            setElementBitmap(_arg_1, _local_3);
        }


    }
}//package com.sulake.habbo.ui.widget.effects

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3271 = "_-z1P" (String#7829, DoABC#4)
// _SafeStr_4386 = "_-31d" (String#2977, DoABC#4)
// _SafeStr_4582 = "_-T1P" (String#619, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5896 = "_-I1q" (String#5107, DoABC#4)


