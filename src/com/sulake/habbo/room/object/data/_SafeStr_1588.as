// by nota

//com.sulake.habbo.room.object.data._SafeStr_1588

package com.sulake.habbo.room.object.data
{
    import com.sulake.habbo.room.IStuffData;

    public class _SafeStr_1588 
    {


        public static function getStuffDataWrapperForType(_arg_1:int):IStuffData
        {
            var _local_3:* = (_arg_1 & 0xFF);
            var _local_2:IStuffData;
            switch (_local_3)
            {
                case 0:
                    _local_2 = (new _SafeStr_1613() as IStuffData);
                    break;
                case 1:
                    _local_2 = (new MapStuffData() as IStuffData);
                    break;
                case 2:
                    _local_2 = (new StringArrayStuffData() as IStuffData);
                    break;
                case 3:
                    _local_2 = (new _SafeStr_1681() as IStuffData);
                    break;
                case 4:
                    _local_2 = (new EmptyStuffData() as IStuffData);
                    break;
                case 5:
                    _local_2 = (new _SafeStr_1660() as IStuffData);
                    break;
                case 6:
                    _local_2 = (new _SafeStr_1671() as IStuffData);
                    break;
                case 7:
                    _local_2 = (new _SafeStr_1674() as IStuffData);
                default:
            };
            if (_local_2 != null)
            {
                _local_2.flags = (_arg_1 & 0xFF00);
            };
            return (_local_2);
        }


    }
}//package com.sulake.habbo.room.object.data

// _SafeStr_1588 = "_-7O" (String#7045, DoABC#3)
// _SafeStr_1613 = "_-xG" (String#10553, DoABC#3)
// _SafeStr_1660 = "_-F1T" (String#7541, DoABC#3)
// _SafeStr_1671 = "_-D1S" (String#7423, DoABC#3)
// _SafeStr_1674 = "_-h1S" (String#9469, DoABC#3)
// _SafeStr_1681 = "_-v1w" (String#10402, DoABC#3)


