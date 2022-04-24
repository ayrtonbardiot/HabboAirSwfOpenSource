// by nota

//com.sulake.habbo.avatar.effects.EffectsParamView

package com.sulake.habbo.avatar.effects
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.window._SafeStr_1695;
    import flash.utils.Timer;
    import com.sulake.habbo.avatar._SafeStr_3339;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import flash.events.TimerEvent;

    public class EffectsParamView implements _SafeStr_13 
    {

        private var _SafeStr_4619:EffectsModel;
        private var _container:_SafeStr_3133;
        private var _catalogPageName:String;
        private var _windowManager:_SafeStr_1695;
        private var _SafeStr_6818:Timer;
        private var _SafeStr_6820:int = 0;
        private var _SafeStr_6819:_SafeStr_3339 = null;

        public function EffectsParamView(_arg_1:EffectsModel, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21)
        {
            _SafeStr_4619 = _arg_1;
            _windowManager = _arg_2;
            _container = _arg_1.controller.view.effectsParamViewContainer;
            _catalogPageName = _arg_1.controller.manager.getProperty("avatareditor.effects.buy.button.catalog.page.name");
            _SafeStr_6818 = new Timer(1000);
            _SafeStr_6818.addEventListener("timer", onSecondsTimer);
            _container.findChildByName("get_more_button").addEventListener("WME_CLICK", onBuyButtonClick);
            updateView(null);
        }

        public function dispose():void
        {
            if (_SafeStr_6818)
            {
                _SafeStr_6818.stop();
                _SafeStr_6818.removeEventListener("timer", onSecondsTimer);
                _SafeStr_6818 = null;
            };
            _windowManager = null;
            _SafeStr_4619 = null;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4619 == null);
        }

        public function updateView(_arg_1:_SafeStr_3339):void
        {
            _SafeStr_6819 = _arg_1;
            _container.visible = true;
            if (_arg_1 == null)
            {
                _container.findChildByName("time_left_bg").visible = false;
                _container.findChildByName("save_to_activate").visible = false;
                _container.findChildByName("effect_name").visible = false;
            }
            else
            {
                _container.findChildByName("effect_name").visible = true;
                if (((!(_arg_1.isActive)) && (!(_arg_1.isPermanent))))
                {
                    _container.findChildByName("time_left_bg").visible = false;
                    _container.findChildByName("save_to_activate").visible = true;
                    _SafeStr_6818.stop();
                }
                else
                {
                    _SafeStr_6820 = _arg_1.secondsLeft;
                    setSecondsLeft(_arg_1.secondsLeft, _arg_1.duration, _arg_1.isPermanent);
                    _container.findChildByName("time_left_bg").visible = true;
                    _container.findChildByName("save_to_activate").visible = false;
                    _SafeStr_6818.start();
                };
                _container.findChildByName("effect_name").caption = (("${fx_" + _arg_1.type) + "}");
            };
        }

        private function setSecondsLeft(_arg_1:int, _arg_2:int, _arg_3:Boolean):void
        {
            var _local_17:* = null;
            var _local_16:int;
            var _local_18:int;
            var _local_7:int;
            var _local_9:int;
            var _local_13:int;
            var _local_10:* = null;
            var _local_14:* = null;
            var _local_15:* = null;
            var _local_5:_SafeStr_3133 = (_container.findChildByName("time_left_bg") as _SafeStr_3133);
            var _local_12:_SafeStr_3264 = _SafeStr_3264(_local_5.findChildByName("progress_bar_bitmap"));
            var _local_6:BitmapData = new BitmapData(_local_12.width, _local_12.height, false, 0);
            var _local_4:int = ((_arg_3) ? _arg_2 : _arg_1);
            var _local_8:Rectangle = new Rectangle(0, 0, int((_local_6.width * (_local_4 / _arg_2))), _local_6.height);
            _local_6.fillRect(_local_8, 2146080);
            _local_12.bitmap = _local_6;
            var _local_11:ITextWindow = ITextWindow(_local_5.findChildByName("effect_time_left"));
            if (_arg_3)
            {
                _local_11.caption = "${avatareditor.effects.active.permanent}";
                _local_17 = _local_11.text;
            }
            else
            {
                if (_arg_1 > 86400)
                {
                    _local_11.caption = "${avatareditor.effects.active.daysleft}";
                    _local_17 = _local_11.text;
                    _local_16 = int(Math.floor((_arg_1 / 86400)));
                    _local_17 = _local_17.replace("%days_left%", _local_16);
                }
                else
                {
                    _local_11.caption = "${avatareditor.effects.active.timeleft}";
                    _local_17 = _local_11.text;
                    _local_18 = _arg_1;
                    _local_7 = int(Math.floor((_local_18 / 3600)));
                    _local_9 = int((Math.floor((_local_18 / 60)) % 60));
                    _local_13 = (_local_18 % 60);
                    _local_10 = ((_local_7 < 10) ? "0" : "");
                    _local_14 = ((_local_9 < 10) ? "0" : "");
                    _local_15 = ((_local_13 < 10) ? "0" : "");
                    if (_local_7 > 0)
                    {
                        _local_17 = _local_17.replace("%time_left%", (((((((_local_10 + _local_7) + ":") + _local_14) + _local_9) + ":") + _local_15) + _local_13));
                    }
                    else
                    {
                        _local_17 = _local_17.replace("%time_left%", ((((_local_14 + _local_9) + ":") + _local_15) + _local_13));
                    };
                };
            };
            _local_11.text = _local_17;
        }

        private function onBuyButtonClick(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_4619.controller.manager.catalog.openCatalogPage(_catalogPageName);
        }

        private function onSecondsTimer(_arg_1:TimerEvent):void
        {
            if (((!(_SafeStr_6819 == null)) && (_SafeStr_6819.isActive)))
            {
                setSecondsLeft(_SafeStr_6820--, _SafeStr_6819.duration, _SafeStr_6819.isPermanent);
            };
        }


    }
}//package com.sulake.habbo.avatar.effects

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3339 = "_-y1N" (String#5817, DoABC#4)
// _SafeStr_4619 = "_-x1i" (String#278, DoABC#4)
// _SafeStr_6818 = "_-jy" (String#6818, DoABC#4)
// _SafeStr_6819 = "_-Fs" (String#11231, DoABC#4)
// _SafeStr_6820 = "_-11p" (String#13137, DoABC#4)


