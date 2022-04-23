// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-TY.Game2StartCounterMessageParser

package _-TY
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2StartCounterMessageParser implements IMessageParser 
    {

        private var _SafeStr_7584:int;


        public function flush():Boolean
        {
            return (false);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7584 = _arg_1.readInteger();
            return (true);
        }

        public function get countDownLength():int
        {
            return (_SafeStr_7584);
        }


    }
}//package _-TY

// _SafeStr_7584 = "_-R15" (String#8337, DoABC#3)


