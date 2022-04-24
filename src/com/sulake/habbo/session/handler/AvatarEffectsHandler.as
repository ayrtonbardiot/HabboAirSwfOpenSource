// by nota

//com.sulake.habbo.session.handler.AvatarEffectsHandler

package com.sulake.habbo.session.handler
{
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import _-w19._SafeStr_1004;
    import _-lk._SafeStr_1323;
    import com.sulake.core.communication.messages.IMessageEvent;

    public class AvatarEffectsHandler extends BaseHandler 
    {

        public function AvatarEffectsHandler(_arg_1:IConnection, _arg_2:IRoomHandlerListener)
        {
            super(_arg_1, _arg_2);
            if (_arg_1 == null)
            {
                return;
            };
        }

        private function onAvatarEffects(_arg_1:IMessageEvent):void
        {
            var _local_3:_SafeStr_1004 = (_arg_1 as _SafeStr_1004);
            var _local_2:_SafeStr_1323 = (_local_3.getParser() as _SafeStr_1323);
            _SafeStr_14.log(("Received active avatar effects: " + _local_2.effects));
            if (((listener) && (listener.events)))
            {
            };
        }


    }
}//package com.sulake.habbo.session.handler

// _SafeStr_1004 = "_-G1V" (String#14578, DoABC#4)
// _SafeStr_1323 = "_-21L" (String#24212, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)


