// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.handler.RoomThumbnailCameraWidgetHandler

package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.RoomDesktop;
    import com.sulake.habbo.ui.widget.camera.RoomThumbnailCameraWidget;
    import _-du._SafeStr_699;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import flash.events.Event;
    import com.sulake.habbo.communication.messages.outgoing.camera._SafeStr_688;

    public class RoomThumbnailCameraWidgetHandler implements IRoomWidgetHandler, _SafeStr_13 
    {

        private var _container:IRoomWidgetHandlerContainer = null;
        private var _SafeStr_5437:RoomDesktop;
        private var _SafeStr_4981:RoomThumbnailCameraWidget;
        private var _SafeStr_6348:_SafeStr_699;

        public function RoomThumbnailCameraWidgetHandler(_arg_1:RoomDesktop)
        {
            _SafeStr_5437 = _arg_1;
        }

        public function get roomDesktop():RoomDesktop
        {
            return (_SafeStr_5437);
        }

        public function getProcessedEvents():Array
        {
            return ([]);
        }

        public function getWidgetMessages():Array
        {
            return (null);
        }

        public function processWidgetMessage(_arg_1:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            return (null);
        }

        public function set widget(_arg_1:RoomThumbnailCameraWidget):void
        {
            _SafeStr_4981 = _arg_1;
        }

        public function set container(_arg_1:IRoomWidgetHandlerContainer):void
        {
            _container = _arg_1;
            _SafeStr_6348 = new _SafeStr_699(onThumbnailStatus);
            _container.connection.addMessageEvent(_SafeStr_6348);
        }

        public function dispose():void
        {
            if ((((_container) && (_container.connection)) && (_SafeStr_6348)))
            {
                _container.connection.removeMessageEvent(_SafeStr_6348);
            };
        }

        public function get disposed():Boolean
        {
            return (false);
        }

        public function processEvent(_arg_1:Event):void
        {
        }

        public function update():void
        {
        }

        public function get type():String
        {
            return ("RWE_ROOM_THUMBNAIL_CAMERA");
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return (_container);
        }

        public function collectPhotoData():_SafeStr_688
        {
            return (_SafeStr_688(_SafeStr_5437.roomEngine.getRenderRoomMessage(_SafeStr_4981.viewPort, _SafeStr_5437.roomBackgroundColor, true)));
        }

        public function sendPhotoData(_arg_1:_SafeStr_688):void
        {
            _container.connection.send(_arg_1);
        }

        private function onThumbnailStatus(_arg_1:_SafeStr_699):void
        {
            _SafeStr_4981.destroy();
            if (_arg_1.getParser().isOk())
            {
                _container.windowManager.alert("${navigator.thumbnail.camera.title}", "${navigator.thumbnail.camera.success}", 16, null);
            }
            else
            {
                if (_arg_1.getParser().isRenderLimitHit())
                {
                    _container.windowManager.alert("${generic.alert.title}", "${camera.render.count.info}", 0, null);
                };
            };
        }


    }
}//package com.sulake.habbo.ui.handler

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5437 = "_-w11" (String#3640, DoABC#4)
// _SafeStr_6348 = "_-p6" (String#12001, DoABC#4)
// _SafeStr_688 = "_-Ep" (String#13442, DoABC#4)
// _SafeStr_699 = "_-71R" (String#19973, DoABC#4)


