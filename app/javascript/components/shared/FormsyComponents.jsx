import { withFormsy } from "formsy-react";
import PropTypes from "prop-types";
import React from "react";

class FormsyInput extends React.Component {
  static propTypes = {
    getErrorMessage: PropTypes.func,
    isPristine: PropTypes.func,
    isValid: PropTypes.func,
    showRequired: PropTypes.func,
    setValue: PropTypes.func,
    getValue: PropTypes.func,
    label: PropTypes.string,
    type: PropTypes.string,
    className: PropTypes.string
  };

  constructor(props) {
    super(props);
  }

  changeValue = event => {
    this.props.setValue(event.currentTarget.value);
  };

  render() {
    const {
      getErrorMessage,
      isPristine,
      isValid,
      showRequired,
      showError,
      getValue,
      label,
      type,
      className
    } = this.props;

    const showErrorMessage = getErrorMessage(),
      isPristineInput = isPristine(),
      isValidInput = isValid(),
      displayRequired = showRequired(),
      displayError = _.isBoolean(showError) ? showError : showError(),
      showRequiredMessage =
        !isPristineInput && !isValidInput && displayRequired;
    console.log(type);
    return (
      <div className={className}>
        {(type === "text" || type === "textarea") && (
          <div>
            {label && <label>{label}</label>}
            {type === "text" && (
              <input
                className="form-control"
                onChange={this.changeValue}
                type={type}
                value={getValue() || ""}
              />
            )}
            {type === "textarea" && (
              <textarea
                rows="5"
                className="form-control"
                onChange={this.changeValue}
                type={type}
                value={getValue() || ""}
              />
            )}
            {showRequiredMessage && (
              <span className="error-message">
                {label || "This field"} is required
              </span>
            )}
            {showErrorMessage && (
              <span className="error-message">{showErrorMessage}</span>
            )}
          </div>
        )}
        {type === "file" && (
          <div>
            {label && <label>{label}</label>}
            <input
              className="form-control"
              onChange={this.changeValue}
              type={type}
              value={getValue() || ""}
            />
            <button className="btn btn-xs btn-info fileButton">
              Select a video file
            </button>
            {showRequiredMessage && (
              <span className="error-message">Please select a file</span>
            )}
            {showErrorMessage && (
              <span className="error-message">{showErrorMessage}</span>
            )}
          </div>
        )}
      </div>
    );
  }
}

export default withFormsy(FormsyInput);

// const FormsyInput = ({
//   getErrorMessage,
//   isPristine,
//   isValid,
//   showRequired,
//   showError,
//   getValue,
//   setValue,
//   label
// }) => {
//   const showErrorMessage = getErrorMessage(),
//     isPristineInput = isPristine(),
//     isValidInput = isValid(),
//     displayRequired = showRequired(),
//     displayError = _.isBoolean(showError) ? showError : showError(),
//     showRequiredMessage = !isPristineInput && !isValidInput && displayRequired;

//   const changeValue = event => {
//     setValue(event.currentTarget.value);
//   };

//   return (
//     <div className="form-group">
//       {label && <label>{label}</label>}
//       <input
//         className="form-control"
//         onChange={changeValue}
//         type="text"
//         value={getValue() || ""}
//       />
//       {showRequiredMessage && (
//         <span className="error-message">
//           {label || "This field"} is required
//         </span>
//       )}
//       {showErrorMessage && (
//         <span className="error-message">{showErrorMessage}</span>
//       )}
//     </div>
//   );
// };
// FormsyInput.propTypes = {
//   getErrorMessage: PropTypes.func,
//   isPristine: PropTypes.func,
//   isValid: PropTypes.func,
//   showRequired: PropTypes.func,
//   setValue: PropTypes.func,
//   getValue: PropTypes.func,
//   label: PropTypes.string
// };
// export default withFormsy(FormsyInput);
