package com.BBsRs.liquidparts;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnFocusChangeListener;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Toast;
import com.BBsRs.liquidparts.R;

public class Swap extends Fragment {
	
	String swappiness;
	boolean swapOn;
	String sdahead;
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
		
		readConfig2();
		
		View page = inflater.inflate(R.layout.two, null);
		
		//second page
        page = inflater.inflate(R.layout.two, null);
        //checkBox
        CheckBox SwapBox = (CheckBox)page.findViewById(R.id.checkBoxSwap);
        SwapBox.setChecked(swapOn);
        SwapBox.setOnCheckedChangeListener(new OnCheckedChangeListener(){
			public void onCheckedChanged(CompoundButton buttonView,
					boolean isChecked) {
					swapOn=isChecked;
			}
        	
        });
        
        //swappi
        final EditText swappiEd = (EditText)page.findViewById(R.id.editTextSwappiness);
        swappiEd.setText(String.valueOf(swappiness));
        swappiEd.setOnFocusChangeListener(new OnFocusChangeListener(){
			public void onFocusChange(View arg0, boolean arg1) {
				if (String.valueOf(swappiEd.getText()).length()>=1){
				if (Integer.valueOf(String.valueOf(swappiEd.getText()))>99){
					swappiEd.setText("99");
				}
				if (Integer.valueOf(String.valueOf(swappiEd.getText()))<1){
					swappiEd.setText("1");
				}}
				else {swappiEd.setText("1");}
				}
        });
        
        //sdAhead
        Spinner spsdah = (Spinner)page.findViewById(R.id.spinner1);
		ArrayAdapter adapter = ArrayAdapter.createFromResource(
	            getActivity(), R.array.sdaheads, android.R.layout.simple_spinner_item);
	    adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
	    spsdah.setAdapter(adapter);
	    spsdah.setSelection(adapter.getPosition(sdahead));
	    spsdah.setOnItemSelectedListener(new OnItemSelectedListener() {
			@Override
			public void onItemSelected(AdapterView<?> arg0, View arg1,
					int arg2, long arg3) {
				sdahead = arg0.getAdapter().getItem(arg2).toString();
			}

			@Override
			public void onNothingSelected(AdapterView<?> arg0) {

			}

	    });
        
        final Button save2 = (Button)page.findViewById(R.id.Button01);
        save2.setOnClickListener(new View.OnClickListener() {
			public void onClick(View v) {
				try {
					swappiEd.clearFocus();
					swappiness = String.valueOf(swappiEd.getText());
					
					writeChanges2();
				} catch (Exception e) {
					Toast.makeText(getActivity(), "Error!", Toast.LENGTH_LONG).show();
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		});
		
		return page;
		
	}
	
	//reading data for second page
	public void readConfig2(){
		String sdswap="Not Found";
		String swappi="";
		sdswap = BashCommand.doCmds("sh","fdisk -l /dev/block/mmcblk0 | grep \"82 Linux swap\" | awk '{print $1}'").replaceAll ("\n", "");
		swappi = BashCommand.doCmds("sh","cat /proc/sys/vm/swappiness").replaceAll ("\n", "");
		
		swapOn=swapSet(sdswap);
		swappiness=swappi;
		sdahead = BashCommand.doCmds("sh","cat /sys/block/mmcblk0/bdi/read_ahead_kb").replaceAll ("\n", "");
	}
	//save and apply new settins
	public void writeChanges2(){
		SharedPreferences settingsA2sd = getActivity().getSharedPreferences("lpa2sd", Context.MODE_PRIVATE);
    	String sw = settingsA2sd.getString("sdswap", "Not Found");
    	if (swapOn) {
    		BashCommand.doCmds("sh","swapon "+sw);
        	} else {
        		BashCommand.doCmds("sh","swapoff "+sw);
        	}
    	String swcont="";
    	String sdreadahead = settingsA2sd.getString("sdahead", "1024"); 
		if (swapOn){
			swcont+="swapon ";
		}else {
			swcont+="swapoff ";
		}
		swcont+=sw+" 2> /dev/null\n";
		swcont+="echo "+"30"+ " > /proc/sys/vm/swappiness\n";
		swcont+="echo "+sdreadahead+" > /sys/devices/virtual/bdi/179:0/read_ahead_kb";
		BashCommand.doCmds("su","echo \""+swcont+"\" > /data/local/userinit.d/02LPswap && chmod 755 /data/local/userinit.d/02LPswap");
		BashCommand.doCmds("su","echo "+sdahead+" > /sys/block/mmcblk0/bdi/read_ahead_kb");
		BashCommand.doCmds("su","echo "+swappiness+" > /proc/sys/vm/swappiness");
		
	}
	
	public boolean swapSet(String swap){
		String swapen="";
		swapen=BashCommand.doCmds("sh","cat /proc/swaps | grep "+swap);
		if (!swapen.equals("")){
			return true;
		}
		return false;
	}
}
