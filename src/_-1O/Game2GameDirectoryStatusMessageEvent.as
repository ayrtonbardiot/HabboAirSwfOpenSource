// by nota

//_-1O.Game2GameDirectoryStatusMessageEvent

package _-1O
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-TY.Game2GameDirectoryStatusMessageParser;

    public class Game2GameDirectoryStatusMessageEvent extends MessageEvent implements IMessageEvent 
    {

        public function Game2GameDirectoryStatusMessageEvent(_arg_1:Function)
        {
            super(_arg_1, Game2GameDirectoryStatusMessageParser);
        }

        public function getParser():Game2GameDirectoryStatusMessageParser
        {
            return (this._SafeStr_7012 as Game2GameDirectoryStatusMessageParser);
        }


    }
}//package _-1O

// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


