// by nota

//com.sulake.habbo.avatar.effects.AvatarEditorGridViewEffects

package com.sulake.habbo.avatar.effects
{
    import com.sulake.habbo.avatar.common._SafeStr_3375;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.avatar.common._SafeStr_3301;
    import com.sulake.core.window.components.IItemGridWindow;
    import __AS3__.vec.Vector;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.avatar._SafeStr_3339;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.habbo.avatar.common.*;

    public class AvatarEditorGridViewEffects implements _SafeStr_3375 
    {

        private var _SafeStr_3882:_SafeStr_3133;
        private var _SafeStr_6636:Boolean = true;
        private var _SafeStr_4619:_SafeStr_3301;
        private var _SafeStr_4674:String;
        private var _SafeStr_6401:IItemGridWindow;
        private var _effectItems:Vector.<AvatarEditorGridItemEffect>;
        private var _notification:_SafeStr_3109;
        private var _SafeStr_4004:_SafeStr_3109;

        public function AvatarEditorGridViewEffects(_arg_1:_SafeStr_3133)
        {
            _SafeStr_3882 = _arg_1;
            _SafeStr_6401 = (_SafeStr_3882.findChildByName("thumbs") as IItemGridWindow);
            _notification = _SafeStr_3882.findChildByName("content_notification");
            _SafeStr_4004 = _SafeStr_3882.findChildByName("content_title");
        }

        public function dispose():void
        {
            if (_SafeStr_6401)
            {
                _SafeStr_6401.dispose();
                _SafeStr_6401 = null;
            };
            _SafeStr_4619 = null;
            if (_SafeStr_3882)
            {
                _SafeStr_3882.dispose();
                _SafeStr_3882 = null;
            };
        }

        public function get window():_SafeStr_3133
        {
            return (_SafeStr_3882);
        }

        public function initFromList(_arg_1:_SafeStr_3301, _arg_2:String):void
        {
            var _local_5:* = null;
            _SafeStr_4619 = _arg_1;
            _SafeStr_4674 = _arg_2;
            _SafeStr_3882.visible = true;
            var _local_3:Array = EffectsModel(_SafeStr_4619).effects;
            _SafeStr_6401.removeGridItems();
            _effectItems = new Vector.<AvatarEditorGridItemEffect>();
            if (_local_3.length == 0)
            {
                _SafeStr_4004.visible = true;
                _notification.visible = true;
            }
            else
            {
                _notification.visible = false;
                _SafeStr_4004.visible = false;
                _local_5 = new AvatarEditorGridItemEffect(null, _SafeStr_4619.controller.manager.windowManager, _SafeStr_4619.controller.manager.assets);
                addGridItem(_local_5);
                for each (var _local_4:_SafeStr_3339 in _local_3)
                {
                    _local_5 = new AvatarEditorGridItemEffect(_local_4, _SafeStr_4619.controller.manager.windowManager, _SafeStr_4619.controller.manager.assets);
                    addGridItem(_local_5);
                };
            };
            showPalettes(0);
            _SafeStr_6636 = false;
        }

        private function addGridItem(_arg_1:AvatarEditorGridItemEffect):void
        {
            _arg_1.window.procedure = partEventProc;
            _effectItems.push(_arg_1);
            _SafeStr_6401.addGridItem(_arg_1.window);
        }

        public function showPalettes(_arg_1:int):void
        {
            var _local_3:_SafeStr_3109 = _SafeStr_3882.findChildByName("palette0");
            var _local_2:_SafeStr_3109 = _SafeStr_3882.findChildByName("palette1");
            _local_3.visible = false;
            _local_2.visible = false;
        }

        public function get firstView():Boolean
        {
            return (_SafeStr_6636);
        }

        public function updateSelection(_arg_1:int, _arg_2:Boolean):void
        {
            if (((_arg_1 >= 0) && (_arg_1 < _effectItems.length)))
            {
                _effectItems[_arg_1].selected = _arg_2;
            };
        }

        public function getGridIndex(_arg_1:int):int
        {
            var _local_2:int;
            _local_2 = 0;
            while (_local_2 < _effectItems.length)
            {
                if (_effectItems[_local_2].effectType == _arg_1)
                {
                    return (_local_2);
                };
                _local_2++;
            };
            return (-1);
        }

        private function partEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:int;
            if (_arg_1.type == "WME_DOWN")
            {
                _local_3 = _SafeStr_6401.getGridItemIndex(_arg_1.window);
                _SafeStr_4619.selectPart(_SafeStr_4674, _local_3);
            };
        }


    }
}//package com.sulake.habbo.avatar.effects

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3301 = "_-f1d" (String#2199, DoABC#4)
// _SafeStr_3339 = "_-y1N" (String#5817, DoABC#4)
// _SafeStr_3375 = "_-n1X" (String#8106, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_4004 = "_-41o" (String#1978, DoABC#4)
// _SafeStr_4619 = "_-x1i" (String#278, DoABC#4)
// _SafeStr_4674 = "_-k10" (String#2944, DoABC#4)
// _SafeStr_6401 = "_-l1o" (String#3329, DoABC#4)
// _SafeStr_6636 = "_-5h" (String#22165, DoABC#4)


