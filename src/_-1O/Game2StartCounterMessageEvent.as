// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-1O.Game2StartCounterMessageEvent

package _-1O
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-TY.Game2StartCounterMessageParser;

    public class Game2StartCounterMessageEvent extends MessageEvent implements IMessageEvent 
    {

        public function Game2StartCounterMessageEvent(_arg_1:Function)
        {
            super(_arg_1, Game2StartCounterMessageParser);
        }

        public function getParser():Game2StartCounterMessageParser
        {
            return (this._SafeStr_7012 as Game2StartCounterMessageParser);
        }


    }
}//package _-1O

// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


