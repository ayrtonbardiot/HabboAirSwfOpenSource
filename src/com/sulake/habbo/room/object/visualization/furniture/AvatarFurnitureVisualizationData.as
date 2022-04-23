// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.visualization.furniture.AvatarFurnitureVisualizationData

package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.habbo.room.object.visualization.avatar.AvatarVisualizationData;
    import com.sulake.habbo.avatar._SafeStr_1701;
    import com.sulake.habbo.avatar._SafeStr_1875;
    import com.sulake.habbo.avatar._SafeStr_3139;
    import com.sulake.habbo.avatar._SafeStr_3138;

    public class AvatarFurnitureVisualizationData extends FurnitureVisualizationData 
    {

        private var _SafeStr_5196:AvatarVisualizationData;

        public function AvatarFurnitureVisualizationData()
        {
            _SafeStr_5196 = new AvatarVisualizationData();
        }

        public function set avatarRenderer(_arg_1:_SafeStr_1701):void
        {
            _SafeStr_5196.avatarRenderer = _arg_1;
        }

        override public function dispose():void
        {
            super.dispose();
            _SafeStr_5196.dispose();
            _SafeStr_5196 = null;
        }

        public function getAvatar(_arg_1:String, _arg_2:Number, _arg_3:String=null, _arg_4:_SafeStr_1875=null, _arg_5:_SafeStr_3139=null):_SafeStr_3138
        {
            return (_SafeStr_5196.getAvatar(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5));
        }


    }
}//package com.sulake.habbo.room.object.visualization.furniture

// _SafeStr_1701 = "_-FF" (String#1596, DoABC#4)
// _SafeStr_1875 = "_-R1S" (String#2190, DoABC#4)
// _SafeStr_3138 = "_-L1S" (String#1270, DoABC#4)
// _SafeStr_3139 = "_-7b" (String#5555, DoABC#4)
// _SafeStr_5196 = "_-k5" (String#9230, DoABC#4)


