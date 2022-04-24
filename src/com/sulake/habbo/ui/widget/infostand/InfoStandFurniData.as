// by nota

//com.sulake.habbo.ui.widget.infostand.InfoStandFurniData

package com.sulake.habbo.ui.widget.infostand
{
    import flash.display.BitmapData;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.habbo.ui.widget.events.RoomWidgetFurniInfoUpdateEvent;

    public class InfoStandFurniData 
    {

        private var _SafeStr_3820:int = 0;
        private var _SafeStr_4158:int = 0;
        private var _name:String = "";
        private var _description:String = "";
        private var _SafeStr_4204:BitmapData;
        private var _SafeStr_5901:int = -1;
        private var _SafeStr_4131:String = "";
        private var _SafeStr_4601:IStuffData = null;
        private var _groupId:int;
        private var _SafeStr_5226:int = 0;
        private var _ownerName:String = "";
        private var _SafeStr_5903:int = -1;
        private var _SafeStr_5904:Boolean = false;


        public function set id(_arg_1:int):void
        {
            _SafeStr_3820 = _arg_1;
        }

        public function set category(_arg_1:int):void
        {
            _SafeStr_4158 = _arg_1;
        }

        public function set name(_arg_1:String):void
        {
            _name = _arg_1;
        }

        public function set description(_arg_1:String):void
        {
            _description = _arg_1;
        }

        public function set image(_arg_1:BitmapData):void
        {
            _SafeStr_4204 = _arg_1;
        }

        public function set purchaseOfferId(_arg_1:int):void
        {
            _SafeStr_5901 = _arg_1;
        }

        public function set extraParam(_arg_1:String):void
        {
            _SafeStr_4131 = _arg_1;
        }

        public function set stuffData(_arg_1:IStuffData):void
        {
            _SafeStr_4601 = _arg_1;
        }

        public function set groupId(_arg_1:int):void
        {
            _groupId = _arg_1;
        }

        public function set ownerId(_arg_1:int):void
        {
            _SafeStr_5226 = _arg_1;
        }

        public function set ownerName(_arg_1:String):void
        {
            _ownerName = _arg_1;
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get category():int
        {
            return (_SafeStr_4158);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get description():String
        {
            return (_description);
        }

        public function get image():BitmapData
        {
            return (_SafeStr_4204);
        }

        public function get purchaseOfferId():int
        {
            return (_SafeStr_5901);
        }

        public function get extraParam():String
        {
            return (_SafeStr_4131);
        }

        public function get stuffData():IStuffData
        {
            return (_SafeStr_4601);
        }

        public function get groupId():int
        {
            return (_groupId);
        }

        public function get ownerId():int
        {
            return (_SafeStr_5226);
        }

        public function get ownerName():String
        {
            return (_ownerName);
        }

        public function get rentOfferId():int
        {
            return (_SafeStr_5903);
        }

        public function set rentOfferId(_arg_1:int):void
        {
            _SafeStr_5903 = _arg_1;
        }

        public function get availableForBuildersClub():Boolean
        {
            return (_SafeStr_5904);
        }

        public function setData(_arg_1:RoomWidgetFurniInfoUpdateEvent):void
        {
            id = _arg_1.id;
            category = _arg_1.category;
            name = _arg_1.name;
            description = _arg_1.description;
            image = _arg_1.image;
            purchaseOfferId = _arg_1.purchaseOfferId;
            extraParam = _arg_1.extraParam;
            stuffData = _arg_1.stuffData;
            groupId = _arg_1.groupId;
            ownerName = _arg_1.ownerName;
            ownerId = _arg_1.ownerId;
            rentOfferId = _arg_1.rentOfferId;
            _SafeStr_5904 = _arg_1.availableForBuildersClub;
        }


    }
}//package com.sulake.habbo.ui.widget.infostand

// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_4131 = "_-p1c" (String#2883, DoABC#4)
// _SafeStr_4158 = "_-pH" (String#830, DoABC#4)
// _SafeStr_4204 = "_-WT" (String#629, DoABC#4)
// _SafeStr_4601 = "_-o1B" (String#1746, DoABC#4)
// _SafeStr_5226 = "_-Ld" (String#2223, DoABC#4)
// _SafeStr_5901 = "_-Qn" (String#6174, DoABC#4)
// _SafeStr_5903 = "_-711" (String#6064, DoABC#4)
// _SafeStr_5904 = "_-y1E" (String#6516, DoABC#4)


