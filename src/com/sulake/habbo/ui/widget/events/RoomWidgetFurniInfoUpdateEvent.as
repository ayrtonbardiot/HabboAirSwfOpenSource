// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.events.RoomWidgetFurniInfoUpdateEvent

package com.sulake.habbo.ui.widget.events
{
    import flash.display.BitmapData;
    import com.sulake.habbo.room.IStuffData;

    public class RoomWidgetFurniInfoUpdateEvent extends RoomWidgetUpdateEvent 
    {

        public static const FURNI:String = "RWFIUE_FURNI";

        private var _SafeStr_3820:int = 0;
        private var _SafeStr_4158:int = 0;
        private var _name:String = "";
        private var _description:String = "";
        private var _SafeStr_4204:BitmapData = null;
        private var _SafeStr_5717:Boolean = false;
        private var _SafeStr_5899:Boolean = false;
        private var _SafeStr_5020:Boolean = false;
        private var _SafeStr_5021:int = 0;
        private var _SafeStr_5900:Boolean = false;
        private var _expiration:int = -1;
        private var _SafeStr_8993:int = -1;
        private var _SafeStr_5901:int = -1;
        private var _SafeStr_4131:String = "";
        private var _SafeStr_5902:Boolean = false;
        private var _SafeStr_4601:IStuffData = null;
        private var _groupId:int = 0;
        private var _SafeStr_5226:int = 0;
        private var _ownerName:String = "";
        private var _SafeStr_5225:int = 0;
        private var _SafeStr_8994:int = -1;
        private var _SafeStr_5903:int = -1;
        private var _purchaseCouldBeUsedForBuyout:Boolean;
        private var _rentCouldBeUsedForBuyout:Boolean;
        private var _SafeStr_5904:Boolean;

        public function RoomWidgetFurniInfoUpdateEvent(_arg_1:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        public function set id(_arg_1:int):void
        {
            _SafeStr_3820 = _arg_1;
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function set category(_arg_1:int):void
        {
            _SafeStr_4158 = _arg_1;
        }

        public function get category():int
        {
            return (_SafeStr_4158);
        }

        public function set name(_arg_1:String):void
        {
            _name = _arg_1;
        }

        public function get name():String
        {
            return (_name);
        }

        public function set description(_arg_1:String):void
        {
            _description = _arg_1;
        }

        public function get description():String
        {
            return (_description);
        }

        public function set image(_arg_1:BitmapData):void
        {
            _SafeStr_4204 = _arg_1;
        }

        public function get image():BitmapData
        {
            return (_SafeStr_4204);
        }

        public function set isWallItem(_arg_1:Boolean):void
        {
            _SafeStr_5717 = _arg_1;
        }

        public function get isWallItem():Boolean
        {
            return (_SafeStr_5717);
        }

        public function set isStickie(_arg_1:Boolean):void
        {
            _SafeStr_5899 = _arg_1;
        }

        public function get isStickie():Boolean
        {
            return (_SafeStr_5899);
        }

        public function set isRoomOwner(_arg_1:Boolean):void
        {
            _SafeStr_5020 = _arg_1;
        }

        public function get isRoomOwner():Boolean
        {
            return (_SafeStr_5020);
        }

        public function set roomControllerLevel(_arg_1:int):void
        {
            _SafeStr_5021 = _arg_1;
        }

        public function get roomControllerLevel():int
        {
            return (_SafeStr_5021);
        }

        public function set isAnyRoomController(_arg_1:Boolean):void
        {
            _SafeStr_5900 = _arg_1;
        }

        public function get isAnyRoomController():Boolean
        {
            return (_SafeStr_5900);
        }

        public function set expiration(_arg_1:int):void
        {
            _expiration = _arg_1;
        }

        public function get expiration():int
        {
            return (_expiration);
        }

        public function set purchaseOfferId(_arg_1:int):void
        {
            _SafeStr_5901 = _arg_1;
        }

        public function get purchaseOfferId():int
        {
            return (_SafeStr_5901);
        }

        public function set extraParam(_arg_1:String):void
        {
            _SafeStr_4131 = _arg_1;
        }

        public function get extraParam():String
        {
            return (_SafeStr_4131);
        }

        public function set isOwner(_arg_1:Boolean):void
        {
            _SafeStr_5902 = _arg_1;
        }

        public function get isOwner():Boolean
        {
            return (_SafeStr_5902);
        }

        public function set stuffData(_arg_1:IStuffData):void
        {
            _SafeStr_4601 = _arg_1;
        }

        public function get stuffData():IStuffData
        {
            return (_SafeStr_4601);
        }

        public function set groupId(_arg_1:int):void
        {
            _groupId = _arg_1;
        }

        public function get groupId():int
        {
            return (_groupId);
        }

        public function set ownerId(_arg_1:int):void
        {
            _SafeStr_5226 = _arg_1;
        }

        public function get ownerId():int
        {
            return (_SafeStr_5226);
        }

        public function set ownerName(_arg_1:String):void
        {
            _ownerName = _arg_1;
        }

        public function get ownerName():String
        {
            return (_ownerName);
        }

        public function set usagePolicy(_arg_1:int):void
        {
            _SafeStr_5225 = _arg_1;
        }

        public function get usagePolicy():int
        {
            return (_SafeStr_5225);
        }

        public function set rentOfferId(_arg_1:int):void
        {
            _SafeStr_5903 = _arg_1;
        }

        public function get rentOfferId():int
        {
            return (_SafeStr_5903);
        }

        public function get purchaseCouldBeUsedForBuyout():Boolean
        {
            return (_purchaseCouldBeUsedForBuyout);
        }

        public function set purchaseCouldBeUsedForBuyout(_arg_1:Boolean):void
        {
            _purchaseCouldBeUsedForBuyout = _arg_1;
        }

        public function get rentCouldBeUsedForBuyout():Boolean
        {
            return (_rentCouldBeUsedForBuyout);
        }

        public function set rentCouldBeUsedForBuyout(_arg_1:Boolean):void
        {
            _rentCouldBeUsedForBuyout = _arg_1;
        }

        public function get availableForBuildersClub():Boolean
        {
            return (_SafeStr_5904);
        }

        public function set availableForBuildersClub(_arg_1:Boolean):void
        {
            _SafeStr_5904 = _arg_1;
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_4131 = "_-p1c" (String#2883, DoABC#4)
// _SafeStr_4158 = "_-pH" (String#830, DoABC#4)
// _SafeStr_4204 = "_-WT" (String#629, DoABC#4)
// _SafeStr_4601 = "_-o1B" (String#1746, DoABC#4)
// _SafeStr_5020 = "_-gX" (String#6609, DoABC#4)
// _SafeStr_5021 = "_-2V" (String#6082, DoABC#4)
// _SafeStr_5225 = "_-2X" (String#8854, DoABC#4)
// _SafeStr_5226 = "_-Ld" (String#2223, DoABC#4)
// _SafeStr_5717 = "_-cq" (String#7083, DoABC#4)
// _SafeStr_5899 = "_-P1S" (String#21105, DoABC#4)
// _SafeStr_5900 = "_-H1J" (String#9046, DoABC#4)
// _SafeStr_5901 = "_-Qn" (String#6174, DoABC#4)
// _SafeStr_5902 = "_-y1h" (String#19870, DoABC#4)
// _SafeStr_5903 = "_-711" (String#6064, DoABC#4)
// _SafeStr_5904 = "_-y1E" (String#6516, DoABC#4)
// _SafeStr_8993 = "_-bS" (String#31681, DoABC#4)
// _SafeStr_8994 = "_-I1s" (String#39364, DoABC#4)


