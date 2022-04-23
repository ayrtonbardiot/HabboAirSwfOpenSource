// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.session.handler.PresentHandler

package com.sulake.habbo.session.handler
{
    import _-81g._SafeStr_158;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import _-z1k._SafeStr_1275;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.session.events.RoomSessionPresentEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    public class PresentHandler extends BaseHandler 
    {

        public function PresentHandler(_arg_1:IConnection, _arg_2:IRoomHandlerListener)
        {
            super(_arg_1, _arg_2);
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.addMessageEvent(new _SafeStr_158(onPresentOpened));
        }

        private function onPresentOpened(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1275 = (_arg_1 as _SafeStr_158).getParser();
            if (_local_2 == null)
            {
                return;
            };
            var _local_3:IRoomSession = listener.getSession(_SafeStr_3937);
            if (_local_3 == null)
            {
                return;
            };
            if (((listener) && (listener.events)))
            {
                listener.events.dispatchEvent(new RoomSessionPresentEvent("RSPE_PRESENT_OPENED", _local_3, _local_2.classId, _local_2.itemType, _local_2.productCode, _local_2.placedItemId, _local_2.placedItemType, _local_2.placedInRoom, _local_2.petFigureString));
            };
        }


    }
}//package com.sulake.habbo.session.handler

// _SafeStr_1275 = "_-JR" (String#39929, DoABC#4)
// _SafeStr_158 = "_-AP" (String#22924, DoABC#4)
// _SafeStr_3937 = "_-jF" (String#1979, DoABC#4)


