// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-1O.Game2GameNotFoundMessageEvent

package _-1O
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-TY.Game2GameNotFoundMessageParser;

    public class Game2GameNotFoundMessageEvent extends MessageEvent implements IMessageEvent 
    {

        public function Game2GameNotFoundMessageEvent(_arg_1:Function)
        {
            super(_arg_1, Game2GameNotFoundMessageParser);
        }

        public function getParser():Game2GameNotFoundMessageParser
        {
            return (this._SafeStr_7012 as Game2GameNotFoundMessageParser);
        }


    }
}//package _-1O

// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


