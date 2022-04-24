// by nota

//com.sulake.habbo.ui.widget.furniture.effectbox.EffectBoxOpenDialogView

package com.sulake.habbo.ui.widget.furniture.effectbox
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextMenuWidget;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import _-j1G._SafeStr_558;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.communication.connection.IConnection;

    public class EffectBoxOpenDialogView implements _SafeStr_13 
    {

        private static const _SafeStr_8701:String = "header_button_close";
        private static const _SafeStr_8961:String = "cancel";
        private static const _SafeStr_8704:String = "ok";

        private var _window:_SafeStr_3133;
        private var _disposed:Boolean = false;
        private var _SafeStr_4981:FurnitureContextMenuWidget;
        private var _windowManager:_SafeStr_1695;
        private var _assets:_SafeStr_21;
        private var _SafeStr_5539:int;

        public function EffectBoxOpenDialogView(_arg_1:FurnitureContextMenuWidget)
        {
            _SafeStr_4981 = _arg_1;
            _windowManager = _arg_1.windowManager;
            _assets = _SafeStr_4981.assets;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            _disposed = true;
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
        }

        public function open(_arg_1:int):void
        {
            _SafeStr_5539 = _arg_1;
            setWindowContent();
            _window.visible = true;
        }

        private function setWindowContent():void
        {
            var _local_1:* = null;
            if (!_window)
            {
                _local_1 = "effectbox_xml";
                _window = (_windowManager.buildFromXML((_assets.getAssetByName(_local_1).content as XML)) as _SafeStr_3133);
                addClickListener("ok");
                addClickListener("cancel");
                addClickListener("header_button_close");
                _window.center();
            };
        }

        public function close():void
        {
            if (_window != null)
            {
                _window.visible = false;
            };
        }

        private function addClickListener(_arg_1:String):void
        {
            _window.findChildByName(_arg_1).addEventListener("WME_CLICK", onMouseClick);
        }

        private function onMouseClick(_arg_1:WindowMouseEvent):void
        {
            var _local_2:* = null;
            switch (_arg_1.target.name)
            {
                case "header_button_close":
                case "cancel":
                    close();
                    break;
                case "ok":
                    connection.send(new _SafeStr_558(_SafeStr_5539));
                    close();
            };
            if (_local_2)
            {
                _SafeStr_4981.messageListener.processWidgetMessage(_local_2);
            };
        }

        private function get connection():IConnection
        {
            return (_SafeStr_4981.handler.container.connection);
        }


    }
}//package com.sulake.habbo.ui.widget.furniture.effectbox

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5539 = "_-z10" (String#3398, DoABC#4)
// _SafeStr_558 = "_-z11" (String#4154, DoABC#4)
// _SafeStr_8701 = "_-u12" (String#6423, DoABC#4)
// _SafeStr_8704 = "_-vm" (String#6712, DoABC#4)
// _SafeStr_8961 = "_-P1x" (String#12057, DoABC#4)


