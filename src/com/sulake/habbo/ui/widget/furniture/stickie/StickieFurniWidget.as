// by nota

//com.sulake.habbo.ui.widget.furniture.stickie.StickieFurniWidget

package com.sulake.habbo.ui.widget.furniture.stickie
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.sulake.core.window._SafeStr_3133;
    import flash.display.BitmapData;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets.IAssetLibrary;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.ui.widget.events.RoomWidgetStickieDataUpdateEvent;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import flash.geom.Rectangle;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.geom.Point;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetStickieSendUpdateMessage;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class StickieFurniWidget extends RoomWidgetBase 
    {

        private static const FIELD_MAX_LINES:int = 14;
        private static const FIELD_MAX_CHARS:int = 500;
        private static const _SafeStr_9017:Number = 100;
        private static const _SafeStr_9018:Number = 100;

        private var _window:_SafeStr_3133;
        protected var _SafeStr_4157:int = -1;
        protected var _SafeStr_4652:String;
        protected var _text:String;
        protected var _SafeStr_4653:String;
        protected var _SafeStr_4360:Boolean;
        private var _SafeStr_4651:BitmapData;
        protected var _windowName:String = "stickieui_container";

        public function StickieFurniWidget(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:IAssetLibrary=null)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        protected function get window():_SafeStr_3133
        {
            return (_window);
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            hideInterface();
            if (_SafeStr_4651)
            {
                _SafeStr_4651.dispose();
            };
            super.dispose();
        }

        override public function registerUpdateEvents(_arg_1:IEventDispatcher):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.addEventListener("RWSDUE_STICKIE_DATA", onObjectUpdate);
            super.registerUpdateEvents(_arg_1);
        }

        override public function unregisterUpdateEvents(_arg_1:IEventDispatcher):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.removeEventListener("RWSDUE_STICKIE_DATA", onObjectUpdate);
        }

        protected function onObjectUpdate(_arg_1:RoomWidgetStickieDataUpdateEvent):void
        {
            hideInterface(false);
            _SafeStr_4157 = _arg_1.objectId;
            _SafeStr_4652 = _arg_1.objectType;
            _text = _arg_1.text;
            _SafeStr_4653 = _arg_1.colorHex;
            _SafeStr_4360 = _arg_1.controller;
            showInterface();
        }

        protected function showInterface():void
        {
            var _local_7:* = null;
            var _local_4:* = null;
            var _local_3:* = null;
            var _local_2:* = null;
            var _local_6:* = null;
            if (_SafeStr_4157 == -1)
            {
                return;
            };
            var _local_5:IAsset = assets.getAssetByName("stickie");
            if (_local_5 == null)
            {
                return;
            };
            var _local_1:XmlAsset = XmlAsset(_local_5);
            if (_local_1 == null)
            {
                return;
            };
            if (_window == null)
            {
                _window = (windowManager.createWindow(_windowName, "", 4, 0, (0x020000 | 0x01), new Rectangle(100, 100, 2, 2), null, 0) as _SafeStr_3133);
                _window.buildFromXML(XML(_local_1.content));
            };
            _local_7 = (_window.findChildByName("text") as ITextFieldWindow);
            if (_local_7 != null)
            {
                _local_7.text = _text;
                _local_7.addEventListener("WE_CHANGE", onTextWindowEvent);
            };
            _local_2 = (_window.findChildByTag("bg") as _SafeStr_3264);
            if (_local_2 != null)
            {
                _local_6 = _SafeStr_4652.replace("post_it", "stickie");
                if (((assets.hasAsset(_local_6)) && (assets.getAssetByName(_local_6) is BitmapDataAsset)))
                {
                    _local_4 = (assets.getAssetByName(_local_6) as BitmapDataAsset);
                }
                else
                {
                    _local_4 = (assets.getAssetByName("stickie_blanco") as BitmapDataAsset);
                    _local_2.color = ("0xFF" + _SafeStr_4653);
                };
                _local_3 = (_local_4.content as BitmapData);
                if (_SafeStr_4651)
                {
                    _local_3 = _SafeStr_4651;
                };
                _local_2.bitmap = new BitmapData(_local_2.width, _local_2.height, true, 0);
                _local_2.bitmap.copyPixels(_local_3, _local_3.rect, new Point(0, 0));
            };
            _local_2 = (_window.findChildByTag("close_button") as _SafeStr_3264);
            if (_local_2 != null)
            {
                _local_4 = (assets.getAssetByName("stickie_close") as BitmapDataAsset);
                _local_3 = (_local_4.content as BitmapData);
                _local_2.bitmap = new BitmapData(_local_2.width, _local_2.height, true, 0);
                _local_2.bitmap.copyPixels(_local_3, _local_3.rect, new Point(0, 0));
                _local_2.addEventListener("WME_CLICK", onMouseEvent);
            };
            _local_2 = (_window.findChildByTag("delete_button") as _SafeStr_3264);
            if (((!(_local_2 == null)) && (_SafeStr_4360)))
            {
                _local_4 = (assets.getAssetByName("stickie_remove") as BitmapDataAsset);
                _local_3 = (_local_4.content as BitmapData);
                _local_2.bitmap = new BitmapData(_local_2.width, _local_2.height, true, 0);
                _local_2.bitmap.copyPixels(_local_3, _local_3.rect, new Point(0, 0));
                _local_2.addEventListener("WME_CLICK", onMouseEvent);
            };
            setColorButtons(((_SafeStr_4360) && (_SafeStr_4652 == "post_it")));
        }

        protected function hideInterface(_arg_1:Boolean=true):void
        {
            if (_arg_1)
            {
                sendUpdate();
            };
            if (_window != null)
            {
                _window.dispose();
                _window = null;
            };
            _SafeStr_4157 = -1;
            _text = null;
            _SafeStr_4360 = false;
        }

        private function setColorButtons(_arg_1:Boolean):void
        {
            var _local_2:* = null;
            var _local_3:int;
            var _local_4:Array = new Array("blue", "purple", "green", "yellow");
            _local_3 = 0;
            while (_local_3 <= _local_4.length)
            {
                _local_2 = _window.findChildByName(_local_4[_local_3]);
                if (_local_2 != null)
                {
                    if (_arg_1)
                    {
                        _local_2.visible = true;
                        _local_2.addEventListener("WME_CLICK", onMouseEvent);
                    }
                    else
                    {
                        _local_2.visible = false;
                    };
                };
                _local_3++;
            };
        }

        protected function storeTextFromField():Boolean
        {
            var _local_1:ITextFieldWindow = (_window.findChildByName("text") as ITextFieldWindow);
            if (_local_1 == null)
            {
                return (false);
            };
            if (_text == _local_1.text)
            {
                return (false);
            };
            _text = _local_1.text;
            return (true);
        }

        protected function sendUpdate():void
        {
            var _local_1:* = null;
            if (_SafeStr_4157 == -1)
            {
                return;
            };
            if (!storeTextFromField())
            {
                return;
            };
            if (messageListener != null)
            {
                _local_1 = new RoomWidgetStickieSendUpdateMessage("RWSUM_STICKIE_SEND_UPDATE", _SafeStr_4157, _text, _SafeStr_4653);
                messageListener.processWidgetMessage(_local_1);
            };
        }

        protected function sendSetColor(_arg_1:uint):void
        {
            var _local_3:* = null;
            if (_SafeStr_4157 == -1)
            {
                return;
            };
            storeTextFromField();
            var _local_2:String = _arg_1.toString(16).toUpperCase();
            if (_local_2.length > 6)
            {
                _local_2 = _local_2.slice((_local_2.length - 6), _local_2.length);
            };
            if (_local_2 == _SafeStr_4653)
            {
                return;
            };
            _SafeStr_4653 = _local_2;
            if (messageListener != null)
            {
                _local_3 = new RoomWidgetStickieSendUpdateMessage("RWSUM_STICKIE_SEND_UPDATE", _SafeStr_4157, _text, _SafeStr_4653);
                messageListener.processWidgetMessage(_local_3);
            };
            showInterface();
        }

        protected function sendDelete():void
        {
            var _local_1:* = null;
            if (_SafeStr_4157 == -1)
            {
                return;
            };
            if (((!(messageListener == null)) && (_SafeStr_4360)))
            {
                _local_1 = new RoomWidgetStickieSendUpdateMessage("RWSUM_STICKIE_SEND_DELETE", _SafeStr_4157);
                messageListener.processWidgetMessage(_local_1);
            };
        }

        private function onTextWindowEvent(_arg_1:_SafeStr_3116):void
        {
            var _local_2:* = null;
            _local_2 = (_window.findChildByName("text") as ITextFieldWindow);
            if (_local_2 == null)
            {
                return;
            };
            _local_2.maxChars = 500;
            if (_local_2.numLines < 14)
            {
                return;
            };
            _local_2.text = _local_2.text.slice(0, (_local_2.text.length - 1));
            _local_2.maxChars = _local_2.length;
        }

        protected function onMouseEvent(_arg_1:WindowMouseEvent):void
        {
            var _local_2:_SafeStr_3109 = (_arg_1.target as _SafeStr_3109);
            var _local_3:String = _local_2.name;
            switch (_local_3)
            {
                case "blue":
                case "purple":
                case "green":
                case "yellow":
                    sendSetColor(_local_2.color);
                    return;
                case "close":
                    hideInterface();
                    return;
                case "delete":
                    sendDelete();
                    hideInterface(false);
                    return;
            };
        }


    }
}//package com.sulake.habbo.ui.widget.furniture.stickie

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_4157 = "_-G8" (String#491, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_4651 = "_-SY" (String#15724, DoABC#4)
// _SafeStr_4652 = "_-61C" (String#3402, DoABC#4)
// _SafeStr_4653 = "_-m10" (String#3030, DoABC#4)
// _SafeStr_9017 = "_-mc" (String#17912, DoABC#4)
// _SafeStr_9018 = "_-sm" (String#17974, DoABC#4)


