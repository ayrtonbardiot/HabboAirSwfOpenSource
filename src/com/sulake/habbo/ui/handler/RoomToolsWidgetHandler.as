// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.handler.RoomToolsWidgetHandler

package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication._SafeStr_25;
    import com.sulake.habbo.navigator._SafeStr_1696;
    import com.sulake.habbo.ui.widget.roomtools.RoomToolsWidget;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import _-Ja._SafeStr_843;
    import _-31H._SafeStr_1082;
    import _-Ja._SafeStr_1569;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import flash.events.Event;
    import com.sulake.habbo.session.events.SessionDataPreferencesEvent;
    import com.sulake.habbo.session.ISessionDataManager;
    import _-M1k._SafeStr_129;

    public class RoomToolsWidgetHandler implements IRoomWidgetHandler 
    {

        private var _disposed:Boolean;
        private var _communicationManagerMessageEvents:Vector.<IMessageEvent> = new Vector.<IMessageEvent>();
        private var _communicationManager:_SafeStr_25;
        private var _navigator:_SafeStr_1696;
        private var _SafeStr_4981:RoomToolsWidget;
        private var _container:IRoomWidgetHandlerContainer;


        public function set widget(_arg_1:RoomToolsWidget):void
        {
            _SafeStr_4981 = _arg_1;
        }

        private function onRoomInfo(_arg_1:IMessageEvent):void
        {
            var _local_3:* = null;
            var _local_2:_SafeStr_1082 = _SafeStr_843(_arg_1).getParser();
            var _local_4:_SafeStr_1569 = _local_2.data;
            if (_local_4)
            {
                _SafeStr_4981.updateRoomData(_local_4);
            };
            if (_local_2.enterRoom)
            {
                if (_local_4)
                {
                    _local_3 = ((_local_4.showOwner) ? ((_SafeStr_4981.localizations.getLocalizationWithParams("room.tool.room.owner.prefix", "By") + " ") + _local_4.ownerName) : _SafeStr_4981.localizations.getLocalizationWithParams("room.tool.public.room", "Public room"));
                    _SafeStr_4981.showRoomInfo(true, _local_4.roomName, _local_3, _local_4.tags);
                    _SafeStr_4981.storeRoomData(_local_4);
                    _SafeStr_4981.enterNewRoom(_local_4.flatId);
                };
            };
        }

        public function toggleRoomInfoWindow():void
        {
            _navigator.toggleRoomInfoVisibility();
        }

        public function goToPrivateRoom(_arg_1:int):void
        {
            _navigator.goToPrivateRoom(_arg_1);
        }

        public function get type():String
        {
            return ("RWE_ROOM_TOOLS");
        }

        public function set container(_arg_1:IRoomWidgetHandlerContainer):void
        {
            _container = _arg_1;
            _container.sessionDataManager.events.addEventListener("APUE_UPDATED", onSessionDataPreferences);
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return (_container);
        }

        public function getWidgetMessages():Array
        {
            return (["RWZTM_ZOOM_TOGGLE"]);
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
        }

        private function onSessionDataPreferences(_arg_1:SessionDataPreferencesEvent):void
        {
        }

        public function update():void
        {
        }

        public function dispose():void
        {
            _disposed = true;
            if (_communicationManager)
            {
                for each (var _local_1:IMessageEvent in _communicationManagerMessageEvents)
                {
                    _communicationManager.removeHabboConnectionMessageEvent(_local_1);
                };
                _communicationManagerMessageEvents = null;
                _communicationManager = null;
            };
            if (((_container) && (_container.sessionDataManager)))
            {
                _container.sessionDataManager.events.removeEventListener("APUE_UPDATED", onSessionDataPreferences);
            };
            _navigator = null;
            _SafeStr_4981 = null;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function set navigator(_arg_1:_SafeStr_1696):void
        {
            _navigator = _arg_1;
        }

        public function get navigator():_SafeStr_1696
        {
            return (_navigator);
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return (_container.sessionDataManager);
        }

        public function set communicationManager(_arg_1:_SafeStr_25):void
        {
            _communicationManager = _arg_1;
            _communicationManagerMessageEvents.push(_communicationManager.addHabboConnectionMessageEvent(new _SafeStr_843(onRoomInfo)));
        }

        public function rateRoom():void
        {
            _container.connection.send(new _SafeStr_129(1));
        }

        public function get canRate():Boolean
        {
            return (_navigator.canRateRoom());
        }


    }
}//package com.sulake.habbo.ui.handler

// _SafeStr_1082 = "_-51j" (String#11299, DoABC#4)
// _SafeStr_129 = "_-VI" (String#28991, DoABC#4)
// _SafeStr_1569 = "_-R1p" (String#1360, DoABC#4)
// _SafeStr_1696 = "_-11U" (String#2010, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_843 = "_-W1I" (String#3535, DoABC#4)


