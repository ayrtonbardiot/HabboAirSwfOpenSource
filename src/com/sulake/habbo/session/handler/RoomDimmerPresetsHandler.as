// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.session.handler.RoomDimmerPresetsHandler

package com.sulake.habbo.session.handler
{
    import _-81g._SafeStr_825;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import _-z1k._SafeStr_1176;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.session.events.RoomSessionDimmerPresetsEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    public class RoomDimmerPresetsHandler extends BaseHandler 
    {

        public function RoomDimmerPresetsHandler(_arg_1:IConnection, _arg_2:IRoomHandlerListener)
        {
            super(_arg_1, _arg_2);
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.addMessageEvent(new _SafeStr_825(onRoomDimmerPresets));
        }

        private function onRoomDimmerPresets(_arg_1:IMessageEvent):void
        {
            var _local_4:int;
            var _local_6:* = null;
            var _local_5:_SafeStr_825 = (_arg_1 as _SafeStr_825);
            if (((_local_5 == null) || (_local_5.getParser() == null)))
            {
                return;
            };
            var _local_2:_SafeStr_1176 = _local_5.getParser();
            var _local_3:IRoomSession = listener.getSession(_SafeStr_3937);
            if (_local_3 == null)
            {
                return;
            };
            var _local_7:RoomSessionDimmerPresetsEvent = new RoomSessionDimmerPresetsEvent("RSDPE_PRESETS", _local_3);
            _local_7.selectedPresetId = _local_2.selectedPresetId;
            _local_4 = 0;
            while (_local_4 < _local_2.presetCount)
            {
                _local_6 = _local_2.getPreset(_local_4);
                if (_local_6 != null)
                {
                    _local_7.storePreset(_local_6.id, _local_6.type, _local_6.color, _local_6.light);
                };
                _local_4++;
            };
            if (((listener) && (listener.events)))
            {
                listener.events.dispatchEvent(_local_7);
            };
        }


    }
}//package com.sulake.habbo.session.handler

// _SafeStr_1176 = "_-K1T" (String#39627, DoABC#4)
// _SafeStr_1624 = "_-61j" (String#33822, DoABC#4)
// _SafeStr_3937 = "_-jF" (String#1979, DoABC#4)
// _SafeStr_825 = "_-91Q" (String#19700, DoABC#4)


