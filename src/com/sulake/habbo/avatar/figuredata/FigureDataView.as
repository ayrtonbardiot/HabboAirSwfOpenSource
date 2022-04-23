// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.figuredata.FigureDataView

package com.sulake.habbo.avatar.figuredata
{
    import com.sulake.habbo.avatar._SafeStr_1875;
    import com.sulake.habbo.window.widgets.IRoomPreviewerWidget;
    import com.sulake.habbo.room.preview.RoomPreviewer;

    public class FigureDataView implements _SafeStr_1875 
    {

        public static const PREVIEW_AVATAR_DIRECTION:int = 4;

        private var _SafeStr_4981:IRoomPreviewerWidget;
        private var _SafeStr_3840:RoomPreviewer;
        private var _SafeStr_4619:FigureData;
        private var _figureString:String;
        private var _SafeStr_4036:Boolean;

        public function FigureDataView(_arg_1:FigureData)
        {
            _SafeStr_4619 = _arg_1;
            _SafeStr_4981 = (_arg_1.avatarEditor.view.getFigureContainer().widget as IRoomPreviewerWidget);
            _SafeStr_3840 = _SafeStr_4981.roomPreviewer;
            _SafeStr_3840.updateRoomWallsAndFloorVisibility(false, false);
        }

        public function update(_arg_1:String, _arg_2:int=0, _arg_3:int=4):void
        {
            var _local_4:* = null;
            _figureString = _arg_1;
            if (_SafeStr_3840.isRoomEngineReady)
            {
                _SafeStr_3840.addAvatarIntoRoom(_arg_1, _arg_2);
                _SafeStr_3840.updateAvatarDirection(_arg_3, _arg_3);
                _SafeStr_3840.updatePreviewRoomView(true);
                _SafeStr_3840.updateRoomEngine();
            }
            else
            {
                _local_4 = _SafeStr_4619.avatarEditor.manager.avatarRenderManager.createAvatarImage(_arg_1, "h", null, this);
                _SafeStr_4981.showPreview(_local_4.getCroppedImage("full"));
            };
        }

        public function avatarImageReady(_arg_1:String):void
        {
            var _local_2:* = null;
            if (_arg_1 == _figureString)
            {
                _local_2 = _SafeStr_4619.avatarEditor.manager.avatarRenderManager.createAvatarImage(_arg_1, "h", null, this);
                _SafeStr_4981.showPreview(_local_2.getCroppedImage("full"));
            };
        }

        public function dispose():void
        {
            _SafeStr_4036 = true;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }


    }
}//package com.sulake.habbo.avatar.figuredata

// _SafeStr_1875 = "_-R1S" (String#2190, DoABC#4)
// _SafeStr_3138 = "_-L1S" (String#1270, DoABC#4)
// _SafeStr_3840 = "_-t6" (String#1593, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_4619 = "_-x1i" (String#278, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)


