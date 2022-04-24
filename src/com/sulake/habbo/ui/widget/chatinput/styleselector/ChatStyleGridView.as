// by nota

//com.sulake.habbo.ui.widget.chatinput.styleselector.ChatStyleGridView

package com.sulake.habbo.ui.widget.chatinput.styleselector
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window.components._SafeStr_3195;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.core.window.components.IItemGridWindow;
    import flash.geom.Rectangle;
    import com.sulake.core.window._SafeStr_3133;
    import flash.geom.Point;

    public class ChatStyleGridView implements _SafeStr_13 
    {

        private static const SCREEN_LEFT_BORDER:int = 92;

        private var _window:_SafeStr_3195;
        private var _SafeStr_8965:ChatStyleSelector;

        public function ChatStyleGridView(_arg_1:ChatStyleSelector, _arg_2:ISessionDataManager)
        {
            _SafeStr_8965 = _arg_1;
            var _local_3:_SafeStr_21 = _arg_1.chatInputView.widget.assets;
            _window = _SafeStr_3195(_arg_1.chatInputView.widget.windowManager.buildFromXML(XML(_local_3.getAssetByName("styleselector_menu_new_xml").content)));
            _window.visible = false;
        }

        public function dispose():void
        {
            _window.dispose();
            _window = null;
            _SafeStr_8965 = null;
        }

        public function get disposed():Boolean
        {
            return (_window == null);
        }

        public function get grid():IItemGridWindow
        {
            return (IItemGridWindow(_window.findChildByName("itemgrid")));
        }

        public function get window():_SafeStr_3195
        {
            return (_window);
        }

        public function alignToSelector(_arg_1:_SafeStr_3133):void
        {
            var _local_2:int;
            var _local_4:Rectangle = new Rectangle();
            _arg_1.getGlobalRectangle(_local_4);
            var _local_3:_SafeStr_3133 = _SafeStr_3133(_window.parent);
            _local_3.x = (_local_4.right - _window.width);
            _local_3.y = (_local_4.bottom - _window.height);
            var _local_5:Point = new Point();
            _local_3.getGlobalPosition(_local_5);
            if (_local_5.x < 92)
            {
                _local_2 = (92 - _local_5.x);
                _local_3.x = (_local_3.x + _local_2);
            };
            _local_3.x = _local_4.x;
            _local_3.y = ((_local_4.bottom - 35) - _window.height);
        }


    }
}//package com.sulake.habbo.ui.widget.chatinput.styleselector

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3195 = "_-b1g" (String#876, DoABC#4)
// _SafeStr_8965 = "_-k1Y" (String#15374, DoABC#4)


