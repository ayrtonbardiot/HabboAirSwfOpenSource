// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.handler.SpamWallPostItWidgetHandler

package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-81g._SafeStr_668;
    import _-z1k._SafeStr_1196;
    import com.sulake.habbo.inventory.items._SafeStr_3154;
    import com.sulake.habbo.ui.widget.events.RoomWidgetSpamWallPostItEditEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetSpamWallPostItFinishEditingMessage;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture.AddSpamWallPostItMessageComposer;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import flash.events.Event;

    public class SpamWallPostItWidgetHandler implements IRoomWidgetHandler 
    {

        private var _disposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer;
        private var _connection:IConnection = null;
        private var _SafeStr_5509:IMessageEvent;


        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get type():String
        {
            return ("RWE_SPAMWALL_POSTIT_WIDGET");
        }

        public function set container(_arg_1:IRoomWidgetHandlerContainer):void
        {
            _container = _arg_1;
        }

        public function set connection(_arg_1:IConnection):void
        {
            _SafeStr_5509 = new _SafeStr_668(onSpamWallPostItRequest);
            _connection = _arg_1;
            _connection.addMessageEvent(_SafeStr_5509);
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                _disposed = true;
                _connection.removeMessageEvent(_SafeStr_5509);
                _connection = null;
            };
        }

        private function onSpamWallPostItRequest(_arg_1:_SafeStr_668):void
        {
            var _local_7:* = null;
            if (_arg_1 == null)
            {
                return;
            };
            var _local_5:_SafeStr_1196 = _arg_1.getParser();
            var _local_2:int = _local_5.itemId;
            var _local_6:String = _local_5.location;
            var _local_3:String = "post_it";
            var _local_4:_SafeStr_3154;
            if (_container.inventory != null)
            {
                _local_4 = _container.inventory.getWallItemById(_local_2);
            };
            if (((!(_local_4 == null)) && (!(_container.roomEngine == null))))
            {
                _local_7 = _container.roomEngine.getWallItemType(_local_4.type);
                if (_local_7.match("post_it_"))
                {
                    _local_3 = _local_7;
                };
            };
            if (_container != null)
            {
                if (_container.events != null)
                {
                    _container.events.dispatchEvent(new RoomWidgetSpamWallPostItEditEvent("RWSWPUE_OPEN_EDITOR", _local_2, _local_6, _local_3));
                };
            };
        }

        public function getWidgetMessages():Array
        {
            return (["RWSWPUE_OPEN_EDITOR", "RWSWPFEE_SEND_POSTIT_DATA"]);
        }

        public function processWidgetMessage(_arg_1:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            var _local_2:* = null;
            var _local_3:* = null;
            switch (_arg_1.type)
            {
                case "RWSWPFEE_SEND_POSTIT_DATA":
                    _local_2 = (_arg_1 as RoomWidgetSpamWallPostItFinishEditingMessage);
                    if (_local_2 != null)
                    {
                        if (_connection != null)
                        {
                            _local_3 = new AddSpamWallPostItMessageComposer(_local_2.objectId, _local_2.location, _local_2.colorHex, _local_2.text);
                            _connection.send(_local_3);
                        };
                    };
            };
            return (null);
        }

        public function getProcessedEvents():Array
        {
            return ([]);
        }

        public function processEvent(_arg_1:Event):void
        {
        }

        public function update():void
        {
        }


    }
}//package com.sulake.habbo.ui.handler

// _SafeStr_1196 = "_-kf" (String#32432, DoABC#4)
// _SafeStr_3154 = "_-kO" (String#2057, DoABC#4)
// _SafeStr_503 = "_-WE" (String#24616, DoABC#4)
// _SafeStr_5509 = "_-1Z" (String#15053, DoABC#4)
// _SafeStr_668 = "_-n3" (String#24650, DoABC#4)


