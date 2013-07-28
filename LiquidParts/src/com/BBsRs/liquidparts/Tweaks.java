package com.BBsRs.liquidparts;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnFocusChangeListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.EditText;
import android.widget.Toast;
import com.BBsRs.liquidparts.R;

public class Tweaks extends Fragment {
	
	int sens, noise,vibTime,threshold;
	boolean haptic;
	
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
		
		readConfig();
		
		View page = inflater.inflate(R.layout.one, null);
		
		//Sensivity
        final EditText sensEd = (EditText)page.findViewById(R.id.editTextSens);
        sensEd.setText(String.valueOf(sens));
        sensEd.setOnFocusChangeListener(new OnFocusChangeListener(){
			public void onFocusChange(View arg0, boolean arg1) {
				if (String.valueOf(sensEd.getText()).length()>=1){
				if (Integer.valueOf(String.valueOf(sensEd.getText()))>75){
					sensEd.setText("75");
				}
				if (Integer.valueOf(String.valueOf(sensEd.getText()))<25){
					sensEd.setText("25");
				}
				}
				else {sensEd.setText("25");}
			}
        	
        });
       
        //noise
        final EditText noiseEd = (EditText)page.findViewById(R.id.editTextNoise);
        noiseEd.setText(String.valueOf(noise));
        noiseEd.setOnFocusChangeListener(new OnFocusChangeListener(){
			public void onFocusChange(View arg0, boolean arg1) {
				if (String.valueOf(noiseEd.getText()).length()>=1){
				if (Integer.valueOf(String.valueOf(noiseEd.getText()))>75){
					noiseEd.setText("75");
				}
				if (Integer.valueOf(String.valueOf(noiseEd.getText()))<50){
					noiseEd.setText("50");
				}
				}
				else {noiseEd.setText("50");}
				}
			
        	
        });
        
        //checkBox
        if (haptic) {}
        CheckBox hapBox = (CheckBox)page.findViewById(R.id.checkBoxHaptick); 
        hapBox.setChecked(haptic);
        hapBox.setOnCheckedChangeListener(new OnCheckedChangeListener(){
			public void onCheckedChanged(CompoundButton buttonView,
					boolean isChecked) {
				haptic=isChecked;
			}
        	
        });
        
        //vibrTime
        final EditText vibrTimeEd = (EditText)page.findViewById(R.id.editTextVibrTime);
        vibrTimeEd.setText(String.valueOf(vibTime));
        vibrTimeEd.setOnFocusChangeListener(new OnFocusChangeListener(){
			public void onFocusChange(View arg0, boolean arg1) {
				if (String.valueOf(vibrTimeEd.getText()).length()>=1){
				if (Integer.valueOf(String.valueOf(vibrTimeEd.getText()))>99){
					vibrTimeEd.setText("99");
				}
				if (Integer.valueOf(String.valueOf(vibrTimeEd.getText()))<10){
					vibrTimeEd.setText("10");
				}
				}
				else {vibrTimeEd.setText("10");}
			}
        	
        });
        
        //sensivity for hard keys
        final EditText SoftSensEd = (EditText)page.findViewById(R.id.editTextSoftNoise);
        SoftSensEd.setText(String.valueOf(threshold));
        SoftSensEd.setOnFocusChangeListener(new OnFocusChangeListener(){
			public void onFocusChange(View arg0, boolean arg1) {
				if (String.valueOf(SoftSensEd.getText()).length()>=1){
				if (Integer.valueOf(String.valueOf(SoftSensEd.getText()))>20){
					SoftSensEd.setText("20");
				}
				if (Integer.valueOf(String.valueOf(SoftSensEd.getText()))<15){
					SoftSensEd.setText("15");
				}
				}
				else {SoftSensEd.setText("15");}
				}
        	
        });
        
        final Button save = (Button)page.findViewById(R.id.button1);
        save.setOnClickListener(new View.OnClickListener() {
			public void onClick(View v) {
				try {
					SoftSensEd.clearFocus();
					vibrTimeEd.clearFocus();
					noiseEd.clearFocus();
					sensEd.clearFocus();
					
					sens = Integer.valueOf(String.valueOf(sensEd.getText()));
					noise =Integer.valueOf(String.valueOf(noiseEd.getText()));
					vibTime = Integer.valueOf(String.valueOf(vibrTimeEd.getText()));
					threshold= Integer.valueOf(String.valueOf(SoftSensEd.getText()));
					writeChanges();
				} catch (Exception e) {
					Toast.makeText(getActivity(), "Error!", Toast.LENGTH_LONG).show();
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		});
		
		return page;
		
	}
	
		public void readConfig(){
			//TouchScreen
			SharedPreferences settingsTweaks = getActivity().getSharedPreferences("lpts", Context.MODE_PRIVATE);
			SharedPreferences.Editor prefEditor = settingsTweaks.edit();
			
			sens=settingsTweaks.getInt("sensitivity", 75);
			noise=settingsTweaks.getInt("noise", 75);
		    
		    
		    //softKeys
		    haptic=settingsTweaks.getBoolean("haptic", true);
		    vibTime=settingsTweaks.getInt("vibdel", 18);
		    threshold=settingsTweaks.getInt("threshold", 30);
		    
		    prefEditor.commit();
		}
	
	public void writeChanges() throws Exception{
		  String fcont = "echo "+String.valueOf(sens)+" > "+"/sys/devices/platform/i2c-adapter/i2c-0/0-005c/sensitivity \n";
		  fcont += "echo "+String.valueOf(noise)+" > "+"/sys/devices/platform/i2c-adapter/i2c-0/0-005c/noise \n";
		  fcont += "echo "+String.valueOf(vibTime)+" > "+"/sys/devices/platform/i2c-adapter/i2c-0/0-0066/vibr \n";
		  fcont += "echo "+String.valueOf(threshold)+" > "+"/sys/devices/platform/i2c-adapter/i2c-0/0-0066/threshold \n";
		  int hf = 0;
		  if (haptic){
			  hf = 1;
		  }
		  fcont += "echo "+Integer.toString(hf)+" > "+"/sys/module/avr/parameters/vibr \n";
		  BashCommand.doCmds("su","echo \""+fcont+"\" > /data/local/userinit.d/01LPScripts && chmod 755 /data/local/userinit.d/01LPScripts");
		  SharedPreferences settingsTweaks = getActivity().getSharedPreferences("lpts", Context.MODE_PRIVATE);
		  SharedPreferences.Editor prefEditor = settingsTweaks.edit();
		  prefEditor.putInt("sensitivity", sens);
		  prefEditor.putInt("noise", noise);
		  prefEditor.putBoolean("haptic", haptic);
		  prefEditor.putInt("vibdel", vibTime); 
		  prefEditor.putInt("threshold", threshold);
		  prefEditor.commit();
		  BashCommand.doCmds("su","sh /data/local/userinit.d/01LPScripts");
	  }
}
