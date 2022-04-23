// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-TY.Game2UserBlockedMessageParser

package _-TY
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2UserBlockedMessageParser implements IMessageParser 
    {

        private var _SafeStr_7587:int;


        public function flush():Boolean
        {
            _SafeStr_7587 = 0;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7587 = _arg_1.readInteger();
            return (true);
        }

        public function get playerBlockLength():int
        {
            return (_SafeStr_7587);
        }


    }
}//package _-TY

// _SafeStr_7587 = "_-zb" (String#10697, DoABC#3)


