// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.handler._SafeStr_3306

package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.furniture.video.YoutubeDisplayWidget;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-81g._SafeStr_439;
    import _-81g._SafeStr_861;
    import _-81g._SafeStr_1027;
    import _-z1k._SafeStr_1230;
    import _-z1k._SafeStr_1494;
    import _-z1k._SafeStr_1298;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.room.events.RoomEngineToWidgetEvent;
    import com.sulake.room.object.IRoomObject;
    import _-02a._SafeStr_564;
    import flash.events.Event;
    import _-02a._SafeStr_153;
    import _-02a._SafeStr_422;

    public class _SafeStr_3306 implements IRoomWidgetHandler 
    {

        private static const CONTROL_COMMAND_PREVIOUS_VIDEO:int = 0;
        private static const CONTROL_COMMAND_NEXT_VIDEO:int = 1;
        private static const CONTROL_COMMAND_PAUSE_VIDEO:int = 2;
        private static const CONTROL_COMMAND_CONTINUE_VIDEO:int = 3;

        private var _container:IRoomWidgetHandlerContainer;
        private var _SafeStr_4981:YoutubeDisplayWidget;
        private var _SafeStr_3983:Vector.<IMessageEvent>;


        public function get type():String
        {
            return ("RWE_YOUTUBE");
        }

        public function set container(_arg_1:IRoomWidgetHandlerContainer):void
        {
            _container = _arg_1;
            addMessageEvent(new _SafeStr_439(onVideo));
            addMessageEvent(new _SafeStr_861(onPlaylists));
            addMessageEvent(new _SafeStr_1027(onControlVideo));
        }

        private function addMessageEvent(_arg_1:IMessageEvent):void
        {
            if (_SafeStr_3983 == null)
            {
                _SafeStr_3983 = new Vector.<IMessageEvent>(0);
            };
            _SafeStr_3983.push(_arg_1);
            _container.connection.addMessageEvent(_arg_1);
        }

        private function removeEvents():void
        {
            for each (var _local_1:IMessageEvent in _SafeStr_3983)
            {
                _container.connection.removeMessageEvent(_local_1);
                _local_1.dispose();
            };
        }

        private function onVideo(_arg_1:_SafeStr_439):void
        {
            var _local_2:_SafeStr_1230 = _arg_1.getParser();
            _SafeStr_4981.showVideo(_local_2.furniId, _local_2.videoId, _local_2.startAtSeconds, _local_2.endAtSeconds, _local_2.state);
        }

        private function onControlVideo(_arg_1:_SafeStr_1027):void
        {
            var _local_2:_SafeStr_1494 = _arg_1.getParser();
            _SafeStr_4981.controlVideo(_local_2.furniId, _local_2.commandId);
        }

        private function onPlaylists(_arg_1:_SafeStr_861):void
        {
            var _local_2:_SafeStr_1298 = _arg_1.getParser();
            _SafeStr_4981.populatePlaylists(_local_2.furniId, _local_2.playlists, _local_2.selectedPlaylistId);
        }

        public function set widget(_arg_1:YoutubeDisplayWidget):void
        {
            _SafeStr_4981 = _arg_1;
        }

        public function getWidgetMessages():Array
        {
            return (null);
        }

        public function processWidgetMessage(_arg_1:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            return (null);
        }

        public function getProcessedEvents():Array
        {
            return ([]);
        }

        public function processEvent(_arg_1:Event):void
        {
            var _local_3:Boolean;
            if (_container.roomEngine == null)
            {
                return;
            };
            var _local_4:RoomEngineToWidgetEvent = (_arg_1 as RoomEngineToWidgetEvent);
            if (_local_4 == null)
            {
                return;
            };
            var _local_2:IRoomObject = _container.roomEngine.getRoomObject(_local_4.roomId, _local_4.objectId, _local_4.category);
            switch (_arg_1.type)
            {
                case "RETWE_OPEN_WIDGET":
                    if (_local_2 != null)
                    {
                        _local_3 = ((_container.isOwnerOfFurniture(_local_2)) || (_container.sessionDataManager.hasSecurity(4)));
                        _SafeStr_4981.show(_local_2, _local_3);
                        _container.connection.send(new _SafeStr_564(_local_2.getId()));
                    };
                    return;
                case "RETWE_CLOSE_WIDGET":
                    _SafeStr_4981.hide(_local_2);
                    return;
            };
        }

        public function update():void
        {
        }

        public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            removeEvents();
            _container = null;
        }

        public function get disposed():Boolean
        {
            return (_container == null);
        }

        public function selectPlaylist(_arg_1:int, _arg_2:String):void
        {
            _container.connection.send(new _SafeStr_153(_arg_1, _arg_2));
        }

        public function switchToPreviousVideo(_arg_1:int):void
        {
            _container.connection.send(new _SafeStr_422(_arg_1, 0));
        }

        public function switchToNextVideo(_arg_1:int):void
        {
            _container.connection.send(new _SafeStr_422(_arg_1, 1));
        }

        public function pauseVideo(_arg_1:int):void
        {
            _container.connection.send(new _SafeStr_422(_arg_1, 2));
        }

        public function continueVideo(_arg_1:int):void
        {
            _container.connection.send(new _SafeStr_422(_arg_1, 3));
        }


    }
}//package com.sulake.habbo.ui.handler

// _SafeStr_1027 = "_-5E" (String#24747, DoABC#4)
// _SafeStr_1230 = "_-6m" (String#38505, DoABC#4)
// _SafeStr_1298 = "_-22K" (String#34278, DoABC#4)
// _SafeStr_1494 = "_-cW" (String#31830, DoABC#4)
// _SafeStr_153 = "_-j1P" (String#30682, DoABC#4)
// _SafeStr_3306 = "_-I1p" (String#11328, DoABC#4)
// _SafeStr_3983 = "_-OX" (String#641, DoABC#4)
// _SafeStr_422 = "_-HR" (String#9077, DoABC#4)
// _SafeStr_439 = "_-g1i" (String#23827, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_564 = "_-Eq" (String#29919, DoABC#4)
// _SafeStr_861 = "_-l1c" (String#23616, DoABC#4)


