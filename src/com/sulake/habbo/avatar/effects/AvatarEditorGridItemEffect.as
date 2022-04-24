// by nota

//com.sulake.habbo.avatar.effects.AvatarEditorGridItemEffect

package com.sulake.habbo.avatar.effects
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.avatar._SafeStr_3339;
    import flash.display.BitmapData;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.window.components.ITextWindow;
    import flash.geom.Rectangle;

    public class AvatarEditorGridItemEffect 
    {

        private var _window:_SafeStr_3133;
        private var _SafeStr_4620:_SafeStr_3109;
        private var _SafeStr_4617:Boolean = false;
        private var _SafeStr_6955:_SafeStr_3339;

        public function AvatarEditorGridItemEffect(_arg_1:_SafeStr_3339, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21)
        {
            _window = _SafeStr_3133(_arg_2.buildFromXML((_arg_3.getAssetByName("avatar_editor_effect_griditem_xml").content as XML)));
            _SafeStr_4620 = _window.findChildByTag("BG_COLOR");
            _SafeStr_6955 = _arg_1;
            if (_arg_1 != null)
            {
                bitmap = _arg_1.icon;
                amount = _arg_1.amountInInventory;
                if (_arg_1.isPermanent)
                {
                    setSecondsLeft(_arg_1.duration, _arg_1.duration);
                }
                else
                {
                    if (_arg_1.isActive)
                    {
                        setSecondsLeft(_arg_1.secondsLeft, _arg_1.duration);
                    };
                };
            }
            else
            {
                bitmap = BitmapData(_arg_2.assets.getAssetByName("avatar_editor_generic_remove_selection").content);
                amount = 1;
            };
            selected = false;
            _window.addEventListener("WME_OVER", onMouseOver);
            _window.addEventListener("WME_OUT", onMousetOut);
        }

        public function get effectType():int
        {
            return ((_SafeStr_6955 != null) ? _SafeStr_6955.type : -1);
        }

        private function onMousetOut(_arg_1:WindowMouseEvent):void
        {
            if (!_SafeStr_4617)
            {
                _SafeStr_4620.visible = false;
            };
            _SafeStr_4620.blend = 1;
        }

        private function onMouseOver(_arg_1:WindowMouseEvent):void
        {
            if (!_SafeStr_4617)
            {
                _SafeStr_4620.visible = true;
                _SafeStr_4620.blend = 0.5;
            };
        }

        public function get window():_SafeStr_3109
        {
            return (_window);
        }

        public function set selected(_arg_1:Boolean):void
        {
            _SafeStr_4617 = _arg_1;
            _SafeStr_4620.visible = _SafeStr_4617;
            _SafeStr_4620.blend = 1;
        }

        private function set bitmap(_arg_1:BitmapData):void
        {
            _SafeStr_3264(_window.findChildByName("bitmap")).bitmap = _arg_1;
        }

        private function set amount(_arg_1:int):void
        {
            var _local_2:_SafeStr_3133 = _SafeStr_3133(_window.findChildByName("effect_amount_bg1"));
            var _local_3:ITextWindow = ITextWindow(_window.findChildByName("effect_amount"));
            _local_2.visible = (_arg_1 > 1);
            _local_3.text = _arg_1.toString();
        }

        private function setSecondsLeft(_arg_1:int, _arg_2:int):void
        {
            _window.findChildByName("duration_container").visible = true;
            var _local_5:_SafeStr_3264 = _SafeStr_3264(_window.findChildByName("progress_bar"));
            var _local_3:BitmapData = new BitmapData(_local_5.width, _local_5.height, false, 0);
            var _local_4:Rectangle = new Rectangle(0, 0, int((_local_3.width * (_arg_1 / _arg_2))), _local_3.height);
            _local_3.fillRect(_local_4, 2146080);
            _local_5.bitmap = _local_3;
        }


    }
}//package com.sulake.habbo.avatar.effects

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3339 = "_-y1N" (String#5817, DoABC#4)
// _SafeStr_4617 = "_-229" (String#2305, DoABC#4)
// _SafeStr_4620 = "_-1k" (String#1879, DoABC#4)
// _SafeStr_6955 = "_-II" (String#14331, DoABC#4)


