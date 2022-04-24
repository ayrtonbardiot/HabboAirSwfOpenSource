// by nota

//_-1O.Game2InArenaQueueMessageEvent

package _-1O
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-TY.Game2InArenaQueueMessageParser;

    public class Game2InArenaQueueMessageEvent extends MessageEvent implements IMessageEvent 
    {

        public function Game2InArenaQueueMessageEvent(_arg_1:Function)
        {
            super(_arg_1, Game2InArenaQueueMessageParser);
        }

        public function getParser():Game2InArenaQueueMessageParser
        {
            return (this._SafeStr_7012 as Game2InArenaQueueMessageParser);
        }


    }
}//package _-1O

// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


