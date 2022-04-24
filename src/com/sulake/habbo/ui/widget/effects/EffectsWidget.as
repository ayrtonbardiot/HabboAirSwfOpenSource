// by nota

//com.sulake.habbo.ui.widget.effects.EffectsWidget

package com.sulake.habbo.ui.widget.effects
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IScrollableListWindow;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.ui.handler._SafeStr_3379;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.habbo.ui.widget.memenu._SafeStr_3271;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class EffectsWidget extends RoomWidgetBase 
    {

        private static const LIST_HEIGHT_MAX:int = 320;
        private static const LIST_HEIGHT_MIN:int = 48;
        private static const TOOLBAR_MARGIN:int = 2;

        private var _SafeStr_3882:_SafeStr_3133;
        private var _SafeStr_4162:IScrollableListWindow;
        private var _SafeStr_5221:_SafeStr_24;

        public function EffectsWidget(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21)
        {
            super(_arg_1, _arg_2, _arg_3);
            this.handler.widget = this;
            _SafeStr_5221 = new _SafeStr_24();
        }

        public function get handler():_SafeStr_3379
        {
            return (_SafeStr_3914 as _SafeStr_3379);
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            if (_SafeStr_5221)
            {
                for each (var _local_1:EffectView in _SafeStr_5221)
                {
                    _local_1.dispose();
                };
                _SafeStr_5221.dispose();
                _SafeStr_5221 = null;
            };
            _SafeStr_4162 = null;
            if (_SafeStr_3882)
            {
                _SafeStr_3882.dispose();
                _SafeStr_3882 = null;
            };
            super.dispose();
        }

        public function open():void
        {
            var _local_2:* = null;
            var _local_1:* = null;
            var _local_3:* = null;
            if (!_SafeStr_3882)
            {
                _local_2 = (assets.getAssetByName("effects_widget") as XmlAsset);
                _SafeStr_3882 = (windowManager.buildFromXML((_local_2.content as XML)) as _SafeStr_3133);
                _local_1 = handler.container.toolbar.getRect();
                _SafeStr_3882.x = (_local_1.right + 2);
                _SafeStr_3882.y = (_local_1.bottom - _SafeStr_3882.height);
                _SafeStr_4162 = (_SafeStr_3882.findChildByName("list") as IScrollableListWindow);
                _local_3 = _SafeStr_3882.findChildByName("close");
                _local_3.addEventListener("WME_CLICK", onClose);
            };
            update();
            _SafeStr_3882.visible = true;
        }

        public function update():void
        {
            var _local_1:* = null;
            var _local_4:int;
            var _local_2:Array = this.handler.container.inventory.getAvatarEffects();
            for each (var _local_3:_SafeStr_3271 in _local_2)
            {
                _local_1 = (_SafeStr_5221.getValue(_local_3.type) as EffectView);
                if (_local_1)
                {
                    _local_1.update();
                }
                else
                {
                    _local_1 = new EffectView(this, _local_3);
                    _SafeStr_5221.add(_local_3.type, _local_1);
                    _SafeStr_4162.addListItem(_local_1.window);
                };
            };
            _local_4 = (_SafeStr_5221.length - 1);
            while (_local_4 >= 0)
            {
                _local_1 = _SafeStr_5221.getWithIndex(_local_4);
                if (_local_2.indexOf(_local_1.effect) == -1)
                {
                    _SafeStr_4162.removeListItem(_local_1.window);
                    _SafeStr_5221.remove(_SafeStr_5221.getKey(_local_4));
                    _local_1.dispose();
                };
                _local_4--;
            };
            var _local_5:int = _SafeStr_4162.scrollableRegion.height;
            _SafeStr_4162.height = Math.max(Math.min(_local_5, 320), 48);
            _SafeStr_3882.findChildByName("no_effects").visible = (_local_2.length == 0);
        }

        public function selectEffect(_arg_1:int, _arg_2:Boolean):void
        {
            if (_arg_2)
            {
                handler.container.inventory.setEffectDeselected(_arg_1);
            }
            else
            {
                handler.container.inventory.setEffectSelected(_arg_1);
            };
        }

        private function onClose(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_3882.visible = false;
        }


    }
}//package com.sulake.habbo.ui.widget.effects

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3271 = "_-z1P" (String#7829, DoABC#4)
// _SafeStr_3379 = "_-gs" (String#10410, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_3914 = "_-w1m" (String#1204, DoABC#4)
// _SafeStr_4162 = "_-CL" (String#282, DoABC#4)
// _SafeStr_5221 = "_-eh" (String#5536, DoABC#4)


